class ReviewController < ApplicationController

def create
    if @reviews.save
        redirect_to @reviews
    else
        render 'new'
    end