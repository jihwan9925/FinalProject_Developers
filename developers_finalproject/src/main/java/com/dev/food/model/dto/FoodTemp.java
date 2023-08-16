package com.dev.food.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FoodTemp {

	private int foodId;
	private int foodNo;
	private String foodName;
	private String foodAddress;
	private String foodOpenTime;
	private String foodMenu;
	private String foodPhone;
	private int allow;
	private int foodReadCount;
	private List<FoodPhotoTemp> foodPhotoTemp;
}
