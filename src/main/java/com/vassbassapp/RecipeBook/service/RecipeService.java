package com.vassbassapp.RecipeBook.service;

import com.vassbassapp.RecipeBook.entities.IngredientCount;
import com.vassbassapp.RecipeBook.entities.Tmp;
import com.vassbassapp.RecipeBook.entities.Recipe;
import lombok.NonNull;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class RecipeService {
    public void recalculateIngredientsCount(@NonNull Recipe recipe,
                                              @NonNull IngredientCount count,
                                              double newVal){
        NumberFormat numF = NumberFormat.getInstance(Locale.ENGLISH);
        DecimalFormat df = (DecimalFormat) numF;
        df.applyPattern("#.##");
        double percent = newVal / (count.getCountNum()/100);
        recipe.getIngredients().forEach(c -> {
            if (c.getCountNum() != null){
                double num = c.getCountNum() / 100 * percent;
                double nn = Double.parseDouble(df.format(num));
                c.setCountNum(nn);
            }
        });
    }

    public Collection<Recipe> findRecipeByIngredientsMatching(@NonNull Collection<Recipe>recipes,
                                                       @NonNull Collection<Tmp>ingredients){
        Map<Recipe, Integer> recipe_ingredientsMatch = new HashMap<>();
        Set<Integer> userIngredientsId = ingredients.stream()
                .map((i) -> i.getIngredient().getId()).collect(Collectors.toSet());

        for (Recipe recipe : recipes){
            Set<Integer> recipeIngredientsId = recipe.getIngredients().stream()
                    .map(i -> i.getIngredient().getId()).collect(Collectors.toSet());
            recipeIngredientsId.retainAll(userIngredientsId);
            int matches = recipeIngredientsId.size();
            if (matches > 0){
                recipe_ingredientsMatch.put(recipe, matches);
            }
        }

        LinkedHashMap<Recipe, Integer> sorted = new LinkedHashMap<>();

        recipe_ingredientsMatch.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .forEachOrdered(x -> sorted.put(x.getKey(), x.getValue()));
        return sorted.keySet();
    }
}
