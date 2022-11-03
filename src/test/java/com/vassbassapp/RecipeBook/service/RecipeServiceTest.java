package com.vassbassapp.RecipeBook.service;

import com.vassbassapp.RecipeBook.entities.Ingredient;
import com.vassbassapp.RecipeBook.entities.IngredientCount;
import com.vassbassapp.RecipeBook.entities.Tmp;
import com.vassbassapp.RecipeBook.entities.Recipe;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class RecipeServiceTest {
    private final RecipeService service = new RecipeService();

    private final Ingredient onion = Ingredient.builder().id(0).title("onion").build();
    private final Ingredient tomato = Ingredient.builder().id(1).title("tomato").build();
    private final Ingredient salt = Ingredient.builder().id(2).title("salt").build();
    private final Ingredient sugar = Ingredient.builder().id(3).title("sugar").build();
    private final Ingredient potato = Ingredient.builder().id(4).title("potato").build();

    @Test
    void recalculateIngredientsCount() {
        Recipe recipe = new Recipe();

        IngredientCount oldCount = IngredientCount.builder().countNum(800D).build();
        recipe.setIngredients(List.of(
                oldCount,
                IngredientCount.builder().countNum(400D).build(),
                IngredientCount.builder().countNum(null).build(),
                IngredientCount.builder().countNum(2D).build(),
                IngredientCount.builder().countNum(1000D).build()
        ));

        service.recalculateIngredientsCount(recipe, oldCount, 200);
        List<IngredientCount>newCounts = recipe.getIngredients().stream().toList();
        assertEquals(newCounts.get(0).getCountNum(), 200);
        assertEquals(newCounts.get(1).getCountNum(), 100);
        assertNull(newCounts.get(2).getCountNum());
        assertEquals(newCounts.get(3).getCountNum(), 0.5);
        assertEquals(newCounts.get(4).getCountNum(), 250);
    }

    @Test
    void findRecipeByIngredientsMatching() {
        Recipe withAllIngredients = new Recipe();
        withAllIngredients.setId(0);
        withAllIngredients.setIngredients(List.of(
                IngredientCount.builder().ingredient(onion).build(),
                IngredientCount.builder().ingredient(tomato).build(),
                IngredientCount.builder().ingredient(salt).build(),
                IngredientCount.builder().ingredient(sugar).build()
        ));

        Recipe withoutOneIngredient = new Recipe();
        withoutOneIngredient.setId(1);
        withoutOneIngredient.setIngredients(List.of(
                IngredientCount.builder().ingredient(onion).build(),
                IngredientCount.builder().ingredient(tomato).build(),
                IngredientCount.builder().ingredient(sugar).build()
        ));

        Recipe withoutMatchIngredients = new Recipe();
        withoutMatchIngredients.setId(2);
        withoutMatchIngredients.setIngredients(List.of(
                IngredientCount.builder().ingredient(potato).build()
        ));

        List<Recipe>recipes = List.of(withAllIngredients, withoutOneIngredient, withoutMatchIngredients);
        List<Recipe> expected = List.of(withAllIngredients, withoutOneIngredient);
        assertIterableEquals(expected, service.findRecipeByIngredientsMatching(recipes, List.of(
                Tmp.builder().ingredient(onion).build(),
                Tmp.builder().ingredient(tomato).build(),
                Tmp.builder().ingredient(salt).build(),
                Tmp.builder().ingredient(sugar).build()
        )));
    }
}