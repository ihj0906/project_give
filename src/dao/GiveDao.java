package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.Donation;
import dto.Exchange;

public class GiveDao {
	
	DataSource dataSource;
	public GiveDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	// 기부 목록
	public ArrayList<Donation> donationList(String keyword) {
		ArrayList<Donation> donationList = new ArrayList<Donation>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from donation where concat_ws(talent1, talent2, subject, content, location) like '%" + keyword + "%'";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Donation donation = new Donation();
				donation.setNo(rs.getInt("no"));
				donation.setTalent1(rs.getString("talent1"));
				donation.setTalent2(rs.getString("talent2"));
				donation.setPeople(rs.getInt("people"));
				donation.setId(rs.getString("id"));
				donation.setSubject(rs.getString("subject"));
				donation.setContent(rs.getString("content"));
				donation.setLocation(rs.getString("location"));
				donation.setClosing_date(rs.getString("closing_date"));
				donationList.add(donation);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return donationList;
	}
	
	// 교환 목록
	public ArrayList<Exchange> exchangeList(String keyword) {
		ArrayList<Exchange> exchangeList = new ArrayList<Exchange>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from exchange where concat_ws(give_talent1, give_talent2, wise_talent1, wise_talent2, subject, content, location) like '%"+keyword+"%'";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Exchange exchange = new Exchange();
				exchange.setNo(rs.getInt("no"));
				exchange.setGive_talent1(rs.getString("give_talent1"));
				exchange.setGive_talent2(rs.getString("give_talent2"));
				exchange.setWish_talent1(rs.getString("wish_talent1"));
				exchange.setWish_talent2(rs.getString("wish_talent2"));
				exchange.setId(rs.getString("id"));
				exchange.setSubject(rs.getString("subject"));
				exchange.setContent(rs.getString("content"));
				exchange.setLocation(rs.getString("location"));
				exchange.setClosing_date(rs.getString("closing_date"));
				exchangeList.add(exchange);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return exchangeList;
	}
	
	/*// 기부 목록 - 전체
	public ArrayList<Donation> donationList(String keyword) {
		ArrayList<Donation> donationList = new ArrayList<Donation>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from donation where concat_ws(category, talent1, talent2, subject, content, location) like '%"+keyword+"%'";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Donation donation = new Donation();
				donation.setNo(rs.getInt("no"));
				donation.setTalent1(rs.getString("talent1"));
				donation.setTalent2(rs.getString("talent2"));
				donation.setPeople(rs.getInt("people"));
				donation.setId(rs.getString("id"));
				donation.setSubject(rs.getString("subject"));
				donation.setContent(rs.getString("content"));
				donation.setLocation(rs.getString("location"));
				donation.setClosing_date(rs.getString("closing_date"));
				donationList.add(donation);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return donationList;
	}*/
		
		
	/*// 기부 목록 - 카테고리 별
	public ArrayList<Donation> donationCategoryList(String category) {
		ArrayList<Donation> donationCategoryList = new ArrayList<Donation>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from donation where category=?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Donation donationCategory = new Donation();
				donationCategory.setNo(rs.getInt("no"));
				donationCategory.setCategory(rs.getString("category"));
				donationCategory.setTalent1(rs.getString("talent1"));
				donationCategory.setTalent2(rs.getString("talent2"));
				donationCategory.setPeople(rs.getInt("people"));
				donationCategory.setId(rs.getString("id"));
				donationCategory.setSubject(rs.getString("subject"));
				donationCategory.setContent(rs.getString("content"));
				donationCategory.setLocation(rs.getString("location"));
				donationCategory.setClosing_date(rs.getString("closing_date"));
				donationCategoryList.add(donationCategory);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return donationCategoryList;
	}*/
	
	// 새 기부 클래스 등록
	public int regDonationClass(Donation donation) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into donation(talent1, talent2, people, id, subject, content, location, closing_date) values (?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, donation.getTalent1());
			pstmt.setString(2, donation.getTalent2());
			pstmt.setInt(3, donation.getPeople());
			pstmt.setString(4, donation.getId());
			pstmt.setString(5, donation.getSubject());
			pstmt.setString(6, donation.getContent());
			pstmt.setString(7, donation.getLocation());
			pstmt.setString(8, donation.getClosing_date());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return result;
	}
	
	// 기부 상세
	public Donation donationDetail(int no) {
		Donation donationDetail = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from donation where no=?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				donationDetail = new Donation();
				donationDetail.setNo(rs.getInt("no"));
				donationDetail.setTalent1(rs.getString("talent1"));
				donationDetail.setTalent2(rs.getString("talent2"));
				donationDetail.setPeople(rs.getInt("people"));
				donationDetail.setId(rs.getString("id"));
				donationDetail.setSubject(rs.getString("subject"));
				donationDetail.setContent(rs.getString("content"));
				donationDetail.setLocation(rs.getString("location"));
				donationDetail.setClosing_date(rs.getString("closing_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
		return donationDetail;
	}
	
	
	
}
