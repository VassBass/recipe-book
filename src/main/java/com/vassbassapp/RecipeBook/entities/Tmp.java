package com.vassbassapp.RecipeBook.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

/**
 * This is a temporary table for searching or editing recipe ingredients.
 */
@Entity
@Table(name = "tmp")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Tmp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tmp_id", nullable = false)
    private Integer id;

    /**
     * This has been done for a few users who are searching or editing recipes.
     * Here we have only one user with id 8080.
     */
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "count_num")
    private Double countNum;

    @Column(name = "count_val")
    private String countVal;

    @ManyToOne
    @JoinColumn(name = "ingredient_id")
    private Ingredient ingredient;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
        Tmp that = (Tmp) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
