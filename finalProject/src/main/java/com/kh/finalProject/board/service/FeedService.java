package com.kh.finalProject.board.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;

public interface FeedService {

	//피드인서트문
	int insertFeed(Board b, ArrayList<Attachment> list);
	
	

}