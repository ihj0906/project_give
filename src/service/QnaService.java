package service;


import java.util.ArrayList;

import dao.QnaDao;
import dto.Faq;
import dto.Qna;
import dto.QnaCommand;

public class QnaService {
	
	private QnaDao qnaDao;
	
	public QnaService(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	public int qnaWrite(QnaCommand qnaComn) {
		int result = qnaDao.qnaWrite(qnaComn);
		return result;
	}
	
	public ArrayList<Qna> qnaList(String id) {
		ArrayList<Qna> qnaList = qnaDao.qnaList(id);
		return qnaList;
	}
	
	public Qna qnaView(int no) {
		Qna qnaView = qnaDao.qnaView(no);
		return qnaView;
	}
	
	public ArrayList<Faq> faqList() {
		ArrayList<Faq> faqList = qnaDao.faqList();
		return faqList;
	}

}
