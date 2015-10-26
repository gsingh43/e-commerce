/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS6320ProjectCSUEBModels;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author gagandeep
 */
public class UserCart implements Serializable {
    
    private int[] productsArray;
    private BigDecimal totalPrice;
    
    public UserCart(){

        productsArray = new int[8];
    }
    public int[] getProductsArray() {
        return productsArray;
    }

    public void setProductsArray(int[] productsArray) {
        for(int i = 0; i < productsArray.length; i++){
            
            this.productsArray[i] = productsArray[i];
        }
    }
    
    public BigDecimal getTotalPrice(){
        return totalPrice;
    }
    
    public void setTotalPrice(BigDecimal totalPrice){
        this.totalPrice = totalPrice;
    }
    
}
