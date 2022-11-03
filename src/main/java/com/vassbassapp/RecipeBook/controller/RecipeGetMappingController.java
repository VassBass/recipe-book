package com.vassbassapp.RecipeBook.controller;

import com.vassbassapp.RecipeBook.entities.IngredientCount;
import com.vassbassapp.RecipeBook.entities.Recipe;
import com.vassbassapp.RecipeBook.entities.Tmp;
import com.vassbassapp.RecipeBook.repository.IngredientCountRepository;
import com.vassbassapp.RecipeBook.repository.IngredientRepository;
import com.vassbassapp.RecipeBook.repository.RecipeRepository;
import com.vassbassapp.RecipeBook.repository.TmpRepository;
import com.vassbassapp.RecipeBook.service.RecipeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
public class RecipeGetMappingController {
    private RecipeRepository recipeRepository;
    private IngredientRepository ingredientRepository;
    private IngredientCountRepository countRepository;
    private TmpRepository tmpRepository;
    private RecipeService recipeService;

    @GetMapping(value = {"/recipes", "/"})
    public String showAllRecipes(Model model){
        tmpRepository.deleteByUserId(8080);
        List<Recipe> recipes = recipeRepository.findAll();
        model.addAttribute("recipes", recipes);
        return "/recipes";
    }

    @GetMapping("/recipe_info/{id}")
    public String showRecipeInfo(@PathVariable("id") int id, Model model){
        Optional<Recipe> r = recipeRepository.findById(id);
        if (r.isPresent()){
            model.addAttribute("recipe", r.get());
            return "/recipe_info";
        }else {
            model.addAttribute("message", "Рецепт с id = " + id + " не найден");
            return "/error";
        }
    }

    @GetMapping("/recipe_add")
    public String recipeAdd(Model model){
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("tmp", Collections.emptyList());
        return "/recipe_edit";
    }

    @GetMapping("/recipe_edit/{id}")
    public String showRecipeTitleEditForm(@PathVariable("id") int id, Model model){
        Optional<Recipe> r = recipeRepository.findById(id);
        if (r.isPresent()){
            Recipe recipe = r.get();
            recipe.getIngredients().forEach(i ->
                    tmpRepository.save(Tmp.builder()
                            .userId(8080)
                            .ingredient(i.getIngredient())
                            .countNum(i.getCountNum())
                            .countVal(i.getCountVal())
                            .build())
                    );
            model.addAttribute("recipe", recipe);
            model.addAttribute("tmp", tmpRepository.findByUserId(8080));
            return "/recipe_edit";
        }else {
            model.addAttribute("message", "Рецепт с id = " + id + " не найден");
            return "/error";
        }
    }

    @GetMapping("/recipe_ingredient_delete")
    public String deleteIngredientFromRecipe(@RequestParam String id,
                                             @RequestParam String recipeId, @RequestParam String title, @RequestParam String description,
                                             Model model){
        tmpRepository.deleteById(Integer.parseInt(id));
        Recipe.RecipeBuilder recipeBuilder = Recipe.builder();
        if (!recipeId.isBlank()){
            recipeBuilder.id(Integer.parseInt(recipeId));
        }
        model.addAttribute("recipe", recipeBuilder.title(title).description(description).build());
        model.addAttribute("ingredients", ingredientRepository.findAll());
        model.addAttribute("tmp", tmpRepository.findByUserId(8080));
        return "/recipe_edit_ingredients";
    }

    @GetMapping("/recipe_delete/{id}")
    public String deleteRecipe(@PathVariable("id") int id){
        recipeRepository.deleteById(id);
        countRepository.deleteAllWhereForeignKeyIsNull();

        return "redirect:/recipes";
    }

    @GetMapping("/recipe_edit_ingredient_count/{id}")
    public String showFormForEditIngredientCount(@PathVariable("id") int id, Model model){
        Optional<IngredientCount> c = countRepository.findById(id);
        if (c.isPresent()){
            IngredientCount count = c.get();
            if (count.getCountNum() == null){
                model.addAttribute("recipe", count.getRecipe());
                return "/recipe_info";
            }else {
                model.addAttribute("count", count);
                model.addAttribute("ingredient", count.getIngredient());
                model.addAttribute("recipe", count.getRecipe());
                return "/recipe_edit_ingredient_count";
            }
        }else {
            model.addAttribute("message", "Количественная величина ингредиента не найдена");
            return "/error";
        }
    }

    @GetMapping("/recipe_search_ingredients")
    public String showRecipeSearchByIngredientsForm(Model model){
        model.addAttribute("list", tmpRepository.findByUserId(8080));
        model.addAttribute("ingredients", ingredientRepository.findAll());
        return "/recipe_search_ingredients";
    }

    @GetMapping("/recipe_search_ingredient_delete/{id}")
    public String deleteIngredientFromSearch(@PathVariable("id") int id){
        tmpRepository.deleteByIngredientIdAndUserId(id, 8080);
        return "redirect:/recipe_search_ingredients";
    }

    @GetMapping("/recipe_search_ingredients_start")
    public String searchRecipeByIngredientsList(Model model){
        List<Recipe>recipes = recipeService.findRecipeByIngredientsMatching(
                recipeRepository.findAll(),
                tmpRepository.findByUserId(8080)
        ).stream().toList();
        model.addAttribute("recipes", recipes);
        tmpRepository.deleteByUserId(8080);
        return "/recipes";
    }

    @GetMapping("/recipe_search_ingredient_clear")
    public String deleteAllIngredientsFromSearch(){
        tmpRepository.deleteByUserId(8080);
        return "redirect:/recipe_search_ingredients";
    }
}