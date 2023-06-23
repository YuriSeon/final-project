package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;


public interface ThemaService {

	//테마 입력
	int insertThema(Board b, Info in, ArrayList<Attachment> list, Theme m);

	//리스트총갯수
	int selectListCount();

}
