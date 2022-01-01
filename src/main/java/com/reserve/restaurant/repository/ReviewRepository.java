package com.reserve.restaurant.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Review;

@Repository
public interface ReviewRepository {

	public List<Review> selectReviewList();
}
