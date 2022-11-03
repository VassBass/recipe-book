package com.vassbassapp.RecipeBook.repository;

import com.vassbassapp.RecipeBook.entities.Tmp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TmpRepository extends JpaRepository<Tmp, Integer> {
    List<Tmp> findByUserId(int userId);
    @Transactional
    void deleteByUserId(int userId);

    @Transactional
    @Modifying
    @Query(value = "delete from tmp t where t.ingredient_id=:ingredient_id and t.user_id=:user_id", nativeQuery = true)
    void deleteByIngredientIdAndUserId(@Param("ingredient_id") int ingredientId,
                                       @Param("user_id") int userId);
}
