package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.Note;
import dto.NoteCommand;

public class NoteDao {
	DataSource dataSource;

	public NoteDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 쪽지를 발송 시 사용
	 * 
	 * @param noteComn 쪽지 작성 시 입력된 값 (보낸사람, 받는사람, 내용)
	 * @return insert가 된 경우 1 리턴
	 */
	public int WriteNote(NoteCommand noteComn) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into note (to_id, from_id, content) values (?,?,?)";
		int result = 0;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noteComn.getToId());
			pstmt.setString(2, noteComn.getFromId());
			pstmt.setString(3, noteComn.getContent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	/**
	 * 받은 쪽지함 목록
	 * 
	 * @param id 쪽지 받은 사람 아이디 = 로그인한 사용자 아이디
	 * @return 로그인한 사용자의 받은쪽지 목록
	 */
	public ArrayList<Note> inbox(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from note where to_id=? and del_to = 2 order by cre_date desc";
		ArrayList<Note> noteList = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Note note = new Note();
				note.setNo(rs.getInt("no"));
				note.setToId(rs.getString("to_id"));
				note.setFromId(rs.getString("from_id"));
				note.setContent(rs.getString("content"));
				note.setSendTime(rs.getTimestamp("cre_date"));
				note.setReadYn(rs.getInt("readyn"));
				note.setDelFrom(rs.getInt("del_from"));
				note.setDelTo(rs.getInt("del_to"));
				noteList.add(note);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return noteList;
	}

	/**
	 * 보낸 쪽지 목록
	 * 
	 * @param id 쪽지 보낸 사용자 ID = 로그인한 사용자 ID
	 * @return 로그인한 사용자의 보낸 쪽지 목록
	 */
	public ArrayList<Note> sent(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from note where from_id=? and del_from = 2 order by cre_date desc";
		ArrayList<Note> noteList = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Note note = new Note();
				note.setNo(rs.getInt("no"));
				note.setToId(rs.getString("to_id"));
				note.setFromId(rs.getString("from_id"));
				note.setContent(rs.getString("content"));
				note.setSendTime(rs.getTimestamp("cre_date"));
				note.setReadYn(rs.getInt("readyn"));
				note.setDelFrom(rs.getInt("del_from"));
				note.setDelTo(rs.getInt("del_to"));
				noteList.add(note);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return noteList;
	}

	/**
	 * 받은쪽지함에서 쪽지 클릭 시 쪽지 상태를 읽음으로 변경
	 * 
	 * @param no 쪽지 고유 번호
	 */
	public void setReadY(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update note set readyn=1 where no=?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	/**
	 * 쪽지 읽기
	 * 
	 * @param no 쪽지 고유 번호
	 * @return no에 해당하는 세부항목들
	 */
	public Note noteDetail(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from note where no=?";
		Note note = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				note = new Note();
				note.setNo(rs.getInt("no"));
				note.setToId(rs.getString("to_id"));
				note.setFromId(rs.getString("from_id"));
				note.setContent(rs.getString("content"));
				note.setSendTime(rs.getTimestamp("cre_date"));
				note.setReadYn(rs.getInt("readyn"));
				note.setDelFrom(rs.getInt("del_from"));
				note.setDelTo(rs.getInt("del_to"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return note;
	}

	public void inboxNotedelete(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update note set del_to = 1 where no = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void sentNotedelete(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update note set del_from = 1 where no = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

}
