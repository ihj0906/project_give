package service;

import java.util.ArrayList;

import dao.BookmarkDao;
import dto.Bookmark;

public class BookmarkService {

	private BookmarkDao bookmarkDao;

	public BookmarkService(BookmarkDao bookmarkDao) {
		this.bookmarkDao = bookmarkDao;
	}

	/**
	 * 해당 게시물에 북마크된 정보가 있는지 확인
	 * @param id       로그인한 사용자ID
	 * @param board_no 게시물번호
	 * @param board_id 게시판 번호 (1 = 기부 / 2 = 교환)
	 * @return 북마크가 되어 있으면 1, 없으면 0 리턴
	 */
	public Bookmark checkbookmark(String id, int board_no, int board_id) {
		String board_name = "donation";
		if(board_id != 1) {
			board_name = "exchange";
		}
		return bookmarkDao.checkBookmark(id, board_name, board_no, board_id);
	}

	/**
	 * 북마크 된 정보를 삭제한다
	 * @param id       로그인한 사용자ID
	 * @param board_no 게시물번호
	 * @param board_id 게시판 번호 (1 = 기부 / 2 = 교환)
	 */
	public void removeBookmark(String id, int board_no, int board_id) {
		bookmarkDao.removeBookmark(id, board_no, board_id);
	}
	
	/**
	 * 북마크를 추가한다
	 * @param id       로그인한 사용자ID
	 * @param board_no 게시물번호
	 * @param board_id 게시판 번호 (1 = 기부 / 2 = 교환)
	 */
	public void addBookmark(String id, int board_no, int board_id) {
		bookmarkDao.addBookmark(id, board_no, board_id);
	}
	
	public ArrayList<Bookmark> listOfBookmark(int pagenum, int contentnum, int board_id, String id){
		String board_name = "donation";
		if(board_id != 1) {
			board_name = "exchange";
		}
		return bookmarkDao.listOfBookmark(board_name, pagenum, contentnum, board_id, id);
	}
	
	/*public ArrayList<Donation> indexDonationList(String id){
		return bookmarkDao.indexDonationList(id);
	}
	
	public ArrayList<Exchange> indexExchangeList(String id){
		return bookmarkDao.indexExchangeList(id);
	}*/
}
