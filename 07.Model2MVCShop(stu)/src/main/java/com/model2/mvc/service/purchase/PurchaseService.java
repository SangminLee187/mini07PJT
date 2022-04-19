package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseService {

	public Purchase addPurchase(Purchase purchaseVO) throws Exception;
	
	public Purchase addPurchaseView(Purchase purchase) throws Exception; //추후수정
	
	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	public Map<String,Object> getPurchaseList(Search search,String userId) throws Exception;

	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	public Purchase updatePurchase(Purchase purchaseVO) throws Exception;
	
	public void updateTranCode(Purchase purchaseVO) throws Exception;

}
