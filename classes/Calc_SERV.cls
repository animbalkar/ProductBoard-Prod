public class Calc_SERV {

	//*****************************************************************************************************************************************************************
	//CALCULATIONS
	//*****************************************************************************************************************************************************************


	public static Double divide10scale(Double a, Double b) {
		Decimal top = Decimal.valueOf(a);
		Decimal divisor = Decimal.valueOf(b);
		Decimal resultDecimal = top.divide(divisor, 10);
		return resultDecimal.doubleValue();

	}

	public static Double calcFull(SubscriptionCalc_DTO_Info par) {
		//Double price = (par.trimFullPeriod/par.billingPeriod)*(par.unitPrice*par.periodCon*par.users);
		//Decimal temp = divide10scale(par.trimFullPeriod, par.billingPeriod);

		Decimal price;

		//MBFIX02 - nejspise bude stacit doplnit jen tento if, ale zaroven se musi overi, zda unit price pro produkty z prvni rady se shoduje s final price na aktivnich assetech
		if (par.users == 0) {
			price = par.newUnitPrice * par.periodLength;
		} else {
			price = par.newUnitPrice * par.periodLength * par.users;
		}

		return price.doubleValue();
	}

	public static Double calcPerc(SubscriptionCalc_DTO_Info par) {
		//Double price = (par.trimDiscPeriod/par.billingPeriod)*((1-(par.percentDisc*0.01))*par.unitPrice*par.periodCon*par.users);
		//Decimal temp = divide10scale(par.trimDiscPeriod, par.billingPeriod);
		Decimal price;

		if (par.users == 0) {
			price = (1 - (par.percentDiscount * 0.01)) * par.newUnitPrice * par.periodLength;
		} else {
			price = (1 - (par.percentDiscount * 0.01)) * par.newUnitPrice * par.periodLength * par.users;
		}
		return price.doubleValue();
	}

	public static Double calcFix(SubscriptionCalc_DTO_Info par) {
		//Double price = (par.trimDiscPeriod/par.billingPeriod)*((par.unitPrice - par.fixDisc)*par.periodCon*par.users);

		// ----  Mitchi - COUNT FIX -----
		//Decimal price = divide10scale(par.trimDiscPeriod, par.billingPeriod) * ((par.unitPrice - par.fixDisc) * par.periodCon * par.users);
		//Decimal temp = divide10scale(par.trimDiscPeriod, par.billingPeriod);
		Decimal price;

		if (par.users == 0) {
			price = (par.newUnitPrice * par.periodLength) - par.fixDiscount;
		} else {
			price = (par.newUnitPrice * par.periodLength * par.users) - par.fixDiscount;
		}


		return price.doubleValue();
	}

	public static Double calcTotal(SubscriptionCalc_DTO_Info par) {
		Double price;
		if (par.isDiscountActual == true) {
			if (par.discountType.equals('amount_off')) {
				price = Calc_SERV.calcFix(par);
			} else if (par.discountType.equals('percent_off')) {
				price = Calc_SERV.calcPerc(par);
			}
		} else {
			price = Calc_SERV.calcFull(par);
		}
		return price;
	}

	/*
	  Toto se musi odstranit, je tu jen proto, aby to nervalo
	 */


	/*public static Double calcFull(CalcParameters par) {
	  //Double price = (par.trimFullPeriod/par.billingPeriod)*(par.unitPrice*par.periodCon*par.users);
	  Decimal temp = divide10scale(par.trimFullPeriod, par.billingPeriod);
	  Decimal price = temp * (par.unitPrice * par.periodCon * par.users);

	  return price.doubleValue();
	  }

	  public static Double calcPerc(CalcParameters par) {
	  //Double price = (par.trimDiscPeriod/par.billingPeriod)*((1-(par.percentDisc*0.01))*par.unitPrice*par.periodCon*par.users);
	  Decimal temp = divide10scale(par.trimDiscPeriod, par.billingPeriod);
	  Decimal price = temp * ((1 - (par.percentDisc * 0.01)) * par.unitPrice * par.periodCon * par.users);
	  return price.doubleValue();
	  }

	  public static Double calcFix(CalcParameters par) {
	  //Double price = (par.trimDiscPeriod/par.billingPeriod)*((par.unitPrice - par.fixDisc)*par.periodCon*par.users);
	  Decimal price = divide10scale(par.trimDiscPeriod, par.billingPeriod) * ((par.unitPrice - par.fixDisc) * par.periodCon * par.users);
	  return price.doubleValue();
	  }

	  public static CalcParameters calcTotal(CalcParameters par) {
	  Double price;

	  IF (par.isDiscountActual) {
	  IF (par.discType.equals('amount_off')) {
	  IF (par.trimFullPeriod == 0) {
	  price = calcFix(par);
	  } ELSE {
	  price = calcFix(par) + calcFull(par);
	  }
	  }
	  IF (par.discType.equals('percent_off')) {
	  IF (par.trimFullPeriod == 0) {
	  price = calcPerc(par);
	  } ELSE {
	  price = calcFull(par) + calcPerc(par);
	  }
	  }
	  IF (par.discType.equals('credit')) {
	  price = calcFull(par);
	  }

	  } else {
	  price = calcFull(par);
	  }
	  par.actionPrice = price;
	  return par;
	  }


	  public static CalcParameters calcCredit(CalcParameters par) {
	  if (par.actionPrice >= par.remCredit) {
	  par.actionPrice -= par.remCredit;
	  par.remCredit = 0;
	  } else {
	  par.remCredit -= par.actionPrice;
	  par.actionPrice = 0;
	  }
	  return par;
	  }
	 */
}