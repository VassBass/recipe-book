package com.vassbassapp.RecipeBook.repository;

import com.vassbassapp.RecipeBook.entities.IngredientCount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface IngredientCountRepository extends JpaRepository<IngredientCount, Integer> {
    @Transactional
    @Modifying
    @Query(value = "delete from ingredient_count c where c.recipe_id is null or c.ingredient_id is null", nativeQuery = true)
    void deleteAllWhereForeignKeyIsNull();
}
