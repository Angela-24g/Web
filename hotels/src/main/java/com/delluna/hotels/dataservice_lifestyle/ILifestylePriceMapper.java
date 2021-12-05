package com.delluna.hotels.dataservice_lifestyle;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.delluna.hotels.common_lifestyle.LifestylePrice;

@Mapper
public interface ILifestylePriceMapper {
	
	@Insert("insert into lifestyle_price(price_type,price,lifestyle_no) values(#{price_type},#{price},#{lifestyle.no})")
	public void save(LifestylePrice lifestylePrice);
	
	@Insert({
		"<script>",
		"insert into lifestyle_price(price_type,price,lifestyle_no) values",
		"<foreach collection='lifestylePrices' item='lifestylePrice' index='index' separator=','>",
			"(#{lifestylePrice.price_type},#{lifestylePrice.price},#{lifestylePrice.lifestyle.no})",
		"</foreach>",
		"</script>"
	})
	void savePrices(@Param(value="lifestylePrices")List<LifestylePrice> lifestylePrices);
	
	@Select("select * from lifestyle_price where lifestyle_no=#{no}")
	public List<LifestylePrice> selectByLifestyleNo(@Param("no")int no);
	
	@Update("update lifestyle_price set price_type=#{price_type}, price=#{price} where no=#{no}")
	public void updateLifestylePrice(LifestylePrice lifestylePrice);
	
	@Insert({
		"<script>","insert into lifestyle_price(no,price_type,price,lifestyle_no) values ",
			"<foreach collection='lifestylePrices' item='lifestylePrice' index='index' separator=','>",
				"(#{lifestylePrice.no},#{lifestylePrice.price_type},#{lifestylePrice.price},#{lifestylePrice.lifestyle.no})",
			"</foreach>",
			" on duplicate key update ",
			"price_type=values(price_type), price=values(price);",
		"</script>"
		})
	void upInsertLifestylePrice(@Param(value="lifestylePrices")List<LifestylePrice> lifestylePrices);
	
	@Delete("delete from lifestyle_price where lifestyle_no=#{lifestyle_no}")
	void deleteAllLifestylePrice(@Param("lifestyle_no")int lifestyle_no);
	
	@Delete({
		"<script>",
		"delete from lifestyle_price where lifestyle_no=#{lifestyle_no} and no not in(",
			"<foreach collection='lifestylePrices' item='lifestylePrice' index='index' separator=','>",
				"#{lifestylePrice.no}",
			"</foreach>",
		")",
		"</script>"
	})
	void deleteLifestylePrice(@Param("lifestyle_no")int lifestyle_no,@Param(value="lifestylePrices")List<LifestylePrice> lifestylePrices);
}
