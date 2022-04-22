package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseService {

	public Purchase addPurchase(Purchase purchaseVO) throws Exception;
	
	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	public Map<String,Object> listPurchase(Search search,String userId) throws Exception;

	public Map<String,Object> listSale(Search search) throws Exception;
	
	public Purchase updatePurchase(Purchase purchaseVO) throws Exception;
	
	public void updateTranCode(Purchase purchaseVO) throws Exception;

}
