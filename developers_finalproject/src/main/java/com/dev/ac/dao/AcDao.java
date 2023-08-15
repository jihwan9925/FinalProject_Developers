package com.dev.ac.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.dev.ac.dto.AcFacilities;
import com.dev.ac.dto.AcFile;
import com.dev.ac.dto.AcHeart;
import com.dev.ac.dto.AcPay;
import com.dev.ac.dto.AcPayList;
import com.dev.ac.dto.AcReservation;
import com.dev.ac.dto.Accommodation;
import com.dev.ac.dto.AfaList;

public interface AcDao {
	
	List<Accommodation> acListAll(SqlSessionTemplate session);
	
	List<Accommodation> acSearchAll(SqlSessionTemplate session,Map param);
	
	Accommodation acDetail(SqlSessionTemplate session, int no);
	
	List<AcHeart> acHeart(SqlSessionTemplate session, int no);
	
	Accommodation acPay(SqlSessionTemplate session, int no);
	
	AcPay checkPayRefund(SqlSessionTemplate session, int no);
	
	int insertPay(SqlSessionTemplate session, AcPay ap);
	
	int insertReservation(SqlSessionTemplate session, Map param);
	
	int deletePay(SqlSessionTemplate session,int acId);
	
	List<Accommodation> acRefundTest(SqlSessionTemplate session);
	
	int insertHeart(SqlSessionTemplate session,Map param);
	
	int deleteHeart(SqlSessionTemplate session,Map param);
	
	int insertAc(SqlSessionTemplate session,Accommodation ac);
	
	int insertAcFile(SqlSessionTemplate session,AcFile af);
	
	int insertAfa(SqlSessionTemplate session,AcFacilities afa);
	
	int insertAfal(SqlSessionTemplate session,AfaList afal);
	
	int insertArv(SqlSessionTemplate session,AcReservation arv);
	
	List<AcFile>  deleteImage(SqlSessionTemplate session,int acId);
	
	AcFacilities deleteAfa(SqlSessionTemplate session,int acId);
	
	List<AfaList>  deleteAfalImage(SqlSessionTemplate session,int afaId);
	
	int deleteAc(SqlSessionTemplate session,int acId);
	
	Accommodation updateRegist(SqlSessionTemplate session, int acId);
	
	List<AcReservation> updateRegistArv(SqlSessionTemplate session, int acId);
	
	AcFacilities updateRegistAfa(SqlSessionTemplate session, int acId);
	
	List<AcFile> updateRegistAf(SqlSessionTemplate session, int acId);
	
	List<AfaList> updateRegistAfal(SqlSessionTemplate session, int afaId);
	
	List<AcFile> updateRegistCheckAf(SqlSessionTemplate session, int acId);
	
	int updateRegistDelAf(SqlSessionTemplate session, int acId);
	
	List<AfaList> updateRegistCheckAfal(SqlSessionTemplate session,int afaId);
	
	int updateRegistDelAfal(SqlSessionTemplate session, int afaId);
	
	int updateAc(SqlSessionTemplate session, Accommodation ac);
	
	int updateInAcFile(SqlSessionTemplate session, AcFile af);
	
	int updateAfa(SqlSessionTemplate session, AcFacilities afa);
	
	int updateInAfal(SqlSessionTemplate session, AfaList afal);
	
	int updateDelArv(SqlSessionTemplate session, int acId);
	
	int updateInArv(SqlSessionTemplate session, AcReservation arv);
	
	List<AcPayList> acMyPage(SqlSessionTemplate session,String memberId);
	
	AcPayList acRefundApply(SqlSessionTemplate session,String orderId);
	
	int updateRefund(SqlSessionTemplate session,Map param);
	
	int insertRefund(SqlSessionTemplate session,Map param);
}
