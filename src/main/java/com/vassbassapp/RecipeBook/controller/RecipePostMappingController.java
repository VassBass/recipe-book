package com.vassbassapp.RecipeBook.controller;

import com.vassbassapp.RecipeBook.entities.Ingredient;
import com.vassbassapp.RecipeBook.entities.IngredientCount;
import com.vassbassapp.RecipeBook.entities.Recipe;
import com.vassbassapp.RecipeBook.entities.Tmp;
import com.vassbassapp.RecipeBook.repository.IngredientCountRepository;
import com.vassbassapp.RecipeBook.repository.IngredientRepository;
import com.vassbassapp.RecipeBook.repository.RecipeRepository;
import com.vassbassapp.RecipeBook.repository.TmpRepository;
import com.vassbassapp.RecipeBook.service.RecipeService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
public class RecipePostMappingController {
    private RecipeRepository recipeRepository;
    private IngredientRepository ingredientRepository;
    private IngredientCountRepository countRepository;
    private RecipeService recipeService;
    private TmpRepository tmpRepository;

    @PostMapping(value = "/recipe_edit", params = "action=ingredients")
    public String addIngredientToRecipe(@RequestParam String recipeId, @RequestParam String title, @RequestParam String description,
                                        Model model){
        Recipe.RecipeBuilder recipeBuilder = Recipe.builder();
        if (!recipeId.isBlank()){
            recipeBuilder.id(Integer.parseInt(recipeId));
        }
        model.addAttribute("recipe", recipeBuilder.title(title).description(description).build());
        model.addAttribute("ingredients", ingredientRepository.findAll());
        model.addAttribute("tmp", tmpRepository.findByUserId(8080));
        return "/recipe_edit_ingredients";
    }

    @PostMapping(value = "/recipe_edit", params = "action=show")
    public String showRecipeEditForm(@RequestParam String recipeId, @RequestParam String title, @RequestParam String description,
                                     Model model){
        Recipe.RecipeBuilder recipeBuilder = Recipe.builder();
        if (!recipeId.isBlank()){
            recipeBuilder.id(Integer.parseInt(recipeId));
        }
        model.addAttribute("recipe", recipeBuilder.title(title).description(description).build());
        model.addAttribute("tmp", tmpRepository.findByUserId(8080));
        return "/recipe_edit";
    }

    @PostMapping(value = "/recipe_edit", params = "action=save")
    public String removeIngredientFromRecipe(@RequestParam String recipeId,
                                             @RequestParam String title,
                                             @RequestParam String description){
        Recipe.RecipeBuilder recipeBuilder = Recipe.builder();
        if (!recipeId.isBlank()){
            int id = Integer.parseInt(recipeId);
            recipeRepository.deleteById(id);
            recipeBuilder.id(id);
        }
        Recipe recipe = recipeRepository.save(recipeBuilder.title(title).description(description).build());

        tmpRepository.findByUserId(8080).forEach(t -> countRepository.save(IngredientCount.builder()
                .recipe(recipe)
                .ingredient(t.getIngredient())
                .countNum(t.getCountNum())
                .countVal(t.getCountVal()).build()));
        tmpRepository.deleteByUserId(8080);

        return "redirect:/recipes";
    }

    @PostMapping("/recipe_ingredient_add")
    public String addIngredientToRecipe(@RequestParam String recipeId, @RequestParam String title, @RequestParam String description,
                                        @RequestParam int ingredientId, @RequestParam(required = false) Double countNum,
                                        @RequestParam(required = false) String countVal, Model model){
        Recipe.RecipeBuilder recipeBuilder = Recipe.builder();
        if (!recipeId.isBlank()){
            recipeBuilder.id(Integer.parseInt(recipeId));
        }

        Optional<Ingredient> i = ingredientRepository.findById(ingredientId);
        if (i.isPresent()) {
            tmpRepository.save(Tmp.builder().userId(8080).ingredient(i.get()).countNum(countNum).countVal(countVal).build());

            model.addAttribute("recipe", recipeBuilder.title(title).description(description).build());
            model.addAttribute("ingredients", ingredientRepository.findAll());
            model.addAttribute("tmp", tmpRepository.findByUserId(8080));
            return "recipe_edit_ingredients";
        }else {
            model.addAttribute("message", "Ингридиент с id = " + ingredientId + " не найден");
            return "/error";
        }
    }

    @PostMapping("/recipe_edit_ingredient_count/{id}")
    public String showFormForEditIngredientCount(@PathVariable("id") int id,
                                                 @RequestParam(required = false) Double countNum,
                                                 Model model){
        Optional<IngredientCount> c = countRepository.findById(id);
        if (c.isPresent()) {
            IngredientCount count = c.get();
            Recipe recipe = count.getRecipe();
            if (countNum == null) {
                return "redirect:/recipe_info/" + recipe.getId();
            }else {
                recipeService.recalculateIngredientsCount(recipe, count, countNum);
                model.addAttribute("recipe", recipe);
                return "/recipe_info";
            }
        }else {
            model.addAttribute("message", "Количественная величина ингредиента не найдена");
            return "/error";
        }
    }

    @PostMapping("/recipe_search")
    public String searchRecipe(@RequestParam String name, Model model){
        ExampleMatcher exampleMatcher = ExampleMatcher.matchingAny()
                .withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase());

        Recipe recipe = new Recipe();
        recipe.setTitle(name);
        Example<Recipe> example = Example.of(recipe, exampleMatcher);

        List<Recipe> recipes = recipeRepository.findAll(example);
        model.addAttribute("recipes", recipes);
        return "/recipes";
    }

    @PostMapping("/recipe_search_ingredient_add")
    public String addIngredientToSearch(@RequestParam int ingredientId,
                                        Model model){
        Optional<Ingredient> i = ingredientRepository.findById(ingredientId);
        if (i.isPresent()){
            Tmp tmp = Tmp.builder().ingredient(i.get()).userId(8080).build();
            tmpRepository.save(tmp);
            return "redirect:/recipe_search_ingredients";
        }else {
            model.addAttribute("message", "Ингридиент с id = " + ingredientId + " не найден");
            return "/error";
        }
    }
}