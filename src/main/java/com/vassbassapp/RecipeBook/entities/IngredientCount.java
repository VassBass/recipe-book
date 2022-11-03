package com.vassbassapp.RecipeBook.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "ingredient_count")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class IngredientCount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "count_id", nullable = false)
    private Integer id;

    @Column(name = "count_num")
    private Double countNum;

    @Column(name = "count_val")
    private String countVal;

    @ManyToOne()
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    @ManyToOne()
    @JoinColumn(name = "ingredient_id")
    private Ingredient ingredient;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCountNum() {
        return countNum;
    }

    public void setCountNum(Double countNum) {
        this.countNum = countNum;
    }

    public String getCountVal() {
        return countVal;
    }

    public void setCountVal(String countVal) {
        this.countVal = countVal;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IngredientCount count = (IngredientCount) o;
        return id.equals(count.id)
                && Objects.equals(countNum, count.countNum)
                && Objects.equals(countVal, count.countVal)
                && Objects.equals(recipe, count.recipe)
                && Objects.equals(ingredient, count.ingredient);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, countNum, countVal, recipe, ingredient);
    }
}
