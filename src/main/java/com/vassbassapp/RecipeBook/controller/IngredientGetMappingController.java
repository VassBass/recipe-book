package com.vassbassapp.RecipeBook.controller;

import com.vassbassapp.RecipeBook.entities.Ingredient;
import com.vassbassapp.RecipeBook.repository.IngredientCountRepository;
import com.vassbassapp.RecipeBook.repository.IngredientRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
public class IngredientGetMappingController {
    private IngredientRepository ingredientRepository;
    private IngredientCountRepository countRepository;

    @GetMapping("/ingredients")
    public String showAllIngredients(Model model){
        List<Ingredient> ingredients = ingredientRepository.findAll();
        model.addAttribute("ingredients", ingredients);
        return "/ingredients";
    }

    @GetMapping("/ingredient_info/{id}")
    public String redirectToIngredientInfo(@PathVariable("id") int id, Model model){
        Optional<Ingredient> i = ingredientRepository.findById(id);
        if (i.isPresent()){
            model.addAttribute("ingredient", i.get());
            return "/ingredient_info";
        }else {
            model.addAttribute("message", "Ингридиент с id = " + id + " не найден");
            return "/error";
        }
    }

    @GetMapping("/ingredient_add")
    public String ingredientAdd(Model model){
        model.addAttribute("ingredient", Ingredient.builder().id(-1).build());
        return "/ingredient_edit";
    }

    @GetMapping("/ingredient_edit/{id}")
    public String redirectToIngredientEditForm(@PathVariable("id") int id, Model model){
        Ingredient ingredient;
        Optional<Ingredient> i = ingredientRepository.findById(id);
        if (i.isPresent()) {
            ingredient = i.get();
            model.addAttribute("ingredient", ingredient);
            return "/ingredient_edit";
        } else {
            model.addAttribute("message", "Ингридиент с id = " + id + " не найден");
            return "/error";
        }
    }

    @GetMapping("/ingredient_delete/{id}")
    public String ingredientDelete(@PathVariable("id") int id){
        ingredientRepository.deleteById(id);
        countRepository.deleteAllWhereForeignKeyIsNull();

        return "redirect:/ingredients";
    }
}
