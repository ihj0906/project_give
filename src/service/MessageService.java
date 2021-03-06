package service;

import java.util.ArrayList;

import dao.NoteDao;
import dto.Note;
import dto.NoteCommand;

public class MessageService {

	private NoteDao noteDao;

	public MessageService(NoteDao noteDao) {
		this.noteDao = noteDao;
	}

	public int writeNote(NoteCommand noteComn) {
		int result = noteDao.WriteNote(noteComn);
		return result;
		
	}
	
	public ArrayList<Note> inbox(String id){
		ArrayList<Note> noteList = noteDao.inbox(id);
		return noteList;
	}
	
	public ArrayList<Note> sent(String id){
		ArrayList<Note> noteList = noteDao.sent(id);
		return noteList;
	}
	
	public void setReadY(int no) {
		noteDao.setReadY(no);
	}
	
	/**
	 * @param no 쪽지 고유 번호
	 * @return 쪽지 상세 내용
	 */
	public Note noteDetail(int no) {
		Note note = noteDao.noteDetail(no);
		return note;
	}
	
	/**
	 * @param no 삭제할 쪽지 고유 번호 
	 */
	public void deleteNote(String noteType, int no) {
		if(noteType.equals("del_to")){
			noteDao.inboxNotedelete(no);
		}else {
			noteDao.sentNotedelete(no);
		}
	}
}
