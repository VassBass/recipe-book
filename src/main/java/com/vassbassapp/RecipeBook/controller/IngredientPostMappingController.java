package com.vassbassapp.RecipeBook.controller;

import com.vassbassapp.RecipeBook.entities.Ingredient;
import com.vassbassapp.RecipeBook.repository.IngredientRepository;
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
public class IngredientPostMappingController {
    private IngredientRepository ingredientRepository;

    @PostMapping("/ingredient_edit/{id}")
    public String editIngredient(@PathVariable("id") int id,
                                 @RequestParam String title,
                                 @RequestParam String description,
                                 Model model){
        Ingredient ingr = new Ingredient();
        if (id > 0){
            Optional<Ingredient> i = ingredientRepository.findById(id);
            if (i.isPresent()) {
                ingr = i.get();
            } else {
                model.addAttribute("message", "Ингридиент с id = " + id + " не найден");
                return "/error";
            }
        }

        ingr.setTitle(title);
        ingr.setDescription(description);
        ingredientRepository.save(ingr);

        return "redirect:/ingredients";
    }

    @PostMapping("/ingredient_search")
    public String searchIngredient(@RequestParam String name, Model model){
        ExampleMatcher exampleMatcher = ExampleMatcher.matchingAny()
                .withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase());

        Ingredient ingredient = new Ingredient();
        ingredient.setTitle(name);
        Example<Ingredient> example = Example.of(ingredient, exampleMatcher);

        List<Ingredient> ingredients = ingredientRepository.findAll(example);
        model.addAttribute("ingredients", ingredients);
        return "/ingredients";
    }
}
