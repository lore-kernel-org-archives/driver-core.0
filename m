Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127871;
	b=IjJIM4F8HLeGRkIryuhWF94tpUMLnA/S74KZ9hinL+mY5vnsmfvt0ESfiIncAL7EoYf7
	 zq7M5Ofq4ATAg0TZ/7M8VX406jGN1kzRReJZl2vZaHTqafizBPCC6FDjvQCBc8sHSqA9R
	 Ev+t5ZSup8jkWWRuO/Gr9p2BgYymtxuqCd1fibXOqxtyTWd1ukNSU/b8aLMielXJ88/v5
	 pNCnZxqx0aSP+1eAAkP/y3qZYQF2TloeLkv9riALlEnJ3sNhrQ8ymYLAmJ1NWmL9yYm6l
	 kT0n64pQNgggSWfNcFEo92DQ7mkqzfa4m047BaAbP1nbwx9iiKQMWcL78dl33P7n0Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=KUFu/t/mV5pHO8gQjtZN29ECFZDCqzhz2vUelKrBLOc=;
	b=qftOWbVZdgXsCJozgrqnNOTOU2g0z3vVn5CsFP5vK+hBdppMR/gIxIWQLCimzhjC4qFz
	 onM8qgsoN0/p7eZkG7yoVrq47jM8tQZmU34eNc03vRij6DMwpscvCSnSatoPuvJ6jWtwa
	 HeCtCg7VZ5rQ5E/idYJdUA96szDdSuacFMNxfy5tqvHFUKopJns0e/YRmx/ARsmeMGmaJ
	 P/B2WNIWmdTrXaCiOAvEzXP60fN6S7hE8HkBq9d4qgPO6H8X32GJxOQ371KlyftvSurx0
	 a7qoDC0wYIqpVeEqRt2/DBxArKqOynkCn0DN0YGvd8VzK84AhxsV/nA5Lp9xUIQc/1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glR7hmTp;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j1TVxXN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A374606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 22:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A374606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glR7hmTp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j1TVxXN0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795127870; x=1826663870;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KUFu/t/mV5pHO8gQjtZN29ECFZDCqzhz2vUelKrBLOc=;
  b=glR7hmTpa0MJlm4gBaQQZ4mpSOpR2CMiz7FvZRykzbarDwVPMi2tPXUc
   /EzN+q6Axae3QnFFJg9nE1U61JaRzaw396iiItcQH28AWsY6vS+288oiw
   n985Mdej9OAfVqUoPXYqyDbH/kaVf+QmES7UawOMZTHgM1o9ybZLNUlRZ
   PVJh8jZcQaV8b6wdFo6z4AwmxHejrTukKr12r1reJyjjFDvRSLHSlkWd+
   8WdxG3Yxrtr0a69kt437q5Q4MT7IiiNPIYOVfb0t0eX3wD9skOg8Yqru2
   dkxFtneuejcVzNDT+ETk5OgMNfSWW2Wg7J8itY5TRR/EF+TOHp7yjt80z
   w==;
X-CSE-ConnectionGUID: hNyOXvueScmomxOn149FMA==
X-CSE-MsgGUID: eKvJR+hIQym9wPSynOm4EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3894001"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3894001"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:37:19 -0800
X-CSE-ConnectionGUID: eqFBC1BNQ8Sw8h0W2S2O6g==
X-CSE-MsgGUID: ua1nPB3ZTuK4i5xr4iDqQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10632263"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:37:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:37:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 14:37:18 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:37:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWW9h/L6b7ubC17GjYzWbeoxGDYJvig/Ezu35cIpIAf3rM+qi22IcELvM/P0RUNTiORX509ZsTrQ8kANCgCnFz1GgIQcCx/b906Xmsrr01UGXBB6JwFEjHZG1DCl6EqtqlchzYkZY8L9EWIImae5BG9bPr9xCcKXcPyHWP3rmbHY4SFQi1B4xnxUrIfXTAUNq6rLSHP6Wn0RqYP31AtefPcVCx/CgUmHQXXaXZeiUi77K266PTrYY8jYBnFXSmqibG6mGpcjFS5Yt5DGJWCdYViR2oF6IvR+4ySbJJxXLIe8WgGAv+p/mgYQLYM1wfI84k21UHPsHn5aHV9oA2OMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUFu/t/mV5pHO8gQjtZN29ECFZDCqzhz2vUelKrBLOc=;
 b=ZOCuRXXqMrn7V2ZU9CzOPNp2TAKAznxxTyhKuW/diNca8ual/RSteFUJGpfL3/HHwwuGZgiMfoRNjC/ldGBefsZlGUVYW7y0iFhi7MSZaXIxJPV547Ulv6fGrumCMLSFm7l3QXF4eHfAbZ4aA7NfZtGqJg2F8ZUdo4TVjUca6NZdPEIv/goxYho4tZ9WFFtW3cSoIsANr524SSdlOARHQsfF54MHxQg9vnwdfyxaseZGkvNigps/nwDxnljm9mJDhTh/nel16q/i450Fpheu38cu3FCIDEl1H+OmlhJjwhH7JmYNXqXeMjfih0CU0pzQmZn9S0lYN2jmI5MLDyK1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUFu/t/mV5pHO8gQjtZN29ECFZDCqzhz2vUelKrBLOc=;
 b=j1TVxXN0Xgc6hmY5uFNRo3YvbNjZuyqZNK+Or1+RkhfKZMdtTnrxew5vDTbluxuTp7yz4Vq2rRfT0WPJVk9SRsL6hFaEsTFpSGgbQ4L6DiQJ72U7iGJd45OXOFIn6lRLBwvbCuUwjV8JCoqrsuUN6uvM9a0bGJnIICEE8p4NMEg=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by LV3PR11MB8604.namprd11.prod.outlook.com
 (2603:10b6:408:1ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:37:14 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 22:37:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Thread-Topic: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Thread-Index: AQHdd6x5MZX0/FRaVUKF18s/TKog8rc13+MAgAAdzQA=
Date: Thu, 19 Nov 2026 22:37:14 +0000
Message-ID: <c45020ffef39314cee4093ba54e6ce7e0b1b187a.camel@intel.com>
References: <20261118223023.19653-3-stuart.summers@intel.com>
	 <20261118223023.19653-4-stuart.summers@intel.com>
	 <av9hGMZz0SZyxCQR@ashevche-desk.local>
In-Reply-To: <av9hGMZz0SZyxCQR@ashevche-desk.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|LV3PR11MB8604:EE_
x-ms-office365-filtering-correlation-id: 56a5725e-a19e-4b96-003c-08df468da8da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|261009223027099003|261021135927099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 9hDAVFOHAe0CuPvPVU7KlFE/CpSyXAjpByGok/DK9Fb029IxRJdUc3GRfsNOJEa9y0MbYHv3zs89phtD8PHyFE8A3FT3S4IyI90lJCRanjrDpOKAO84/jRyMLbdmqVzPrQSBfpcMr2r9geS7TN2uUmbT+MO/rQTHKzNbf8moA9h+j9pKOcl3cOiGdrXUHDGQ/TLYlOL9d80SQzszzIi8ntuOpLaX00r6xgWNdOI3WYbEyH5hkR4h9Q0zZxZn2VUUBV/xNF6P5SOH1aHfq6toMuiy+H67XCE5yptQ5Ajch4KG763SPHtVEhQw+aikGhzotVEYHjng+1kyc1LBKYnewhBmgEengOuJ0ekW3u56tj9EsQ/7JFL2Oh1zoepOhsWOTmVDPvSWtmtTQu8i4Abq0EbcI5EXEgRXo2ZzfDVBLL7OpnNoCfd4spZ+z2unDV/oz7x47kJlrj0mP78LbdFQus6KEC1jfCnvHpmCIE9vyPXClxfmZQ3S7R7kqIgQtpRVozm3Mwf+MLPVCvp09EvfKJRIGTCwicKhmQg0oOh9NMF0mFdxoKRHwMhYiglMtDQ2Tf7Pj8I4rKNeQ9ljYq3wbVnGL0PtVR0XMZsOcv0fNSfdgcNz7M2psP41OxodMTYXx4qh0BZBC7/mBAmhsJFgdSVuPDH+qZxySceYbkDAgrzWo2lQgqSnDonoljNkgRfVWjfXcRQZ8H1SsmZH+UvZovnEfSoyv2QwKOr2AUMUhdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(261009223027099003)(261021135927099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTUwN1BQMnBsRUNPRDl5QThKL0pQYk1LbGI2bndoZ2VGYjlyekJWdmxHMWV5?=
 =?utf-8?B?L3pVNHk5ODJ3SnJ2TEtxK2N1VkFxMzhiR0NYMnVVZENFSnU3SzJRS1F2dEZP?=
 =?utf-8?B?TGFsb1VQRVJPM3hvMXI0eERwTGs2U1hqV2hNa1ZJVmlLcGtUUHBpTFdmM1Z5?=
 =?utf-8?B?V21wb0wrUUJzU3oxdkNteEhaelVWS09CV29EQXoyY3BzK3lkSWxOYWx4QWZi?=
 =?utf-8?B?ZE5iblVXVHZsZUMyd1BVQXRxY0RDWW5TYTRidERFTWszQnBTSEROZkkvNTlj?=
 =?utf-8?B?UXk0ZVVKUzJVZk15bExrZGRCYmtndm5pSytOaDRQQ1R1S1F6ZklRQURvS3Zk?=
 =?utf-8?B?eFZGRHJFUEkvZEk3dGFLdFVrSGhsKzZPbk5EeTJBSnY1T01mY3Q2cDlhc2p2?=
 =?utf-8?B?WUs2NWp2V3BRa0F1S2ZBejVYTjAwMk12S3Y2MUVVbURRblB1TTJBSGdHZk8z?=
 =?utf-8?B?RG5JSjg1N25Xdzlid0NwRzM3THl3TXpXZVpJNHpFK2E0UG5nV0s4SWgrcWZx?=
 =?utf-8?B?TDh5T2lPL1RseVJRQVpsYnAyUHhsZmMyOHdNQ2pLZU5pNFN3LzRxYXJvRUMw?=
 =?utf-8?B?aGttYXQ3UVpvM1JLQVREK2h2cHdnSi80TTF0Y2JmaytDL2dZb2tqei95Ukti?=
 =?utf-8?B?cXRDK3ltZUI5S2MrWVROMGZjVU5USk9YNjNwdUdMVnFQemEzOUZGTDZqcktm?=
 =?utf-8?B?NmcxWnJGNXlKc1pPQ2ZBNkw4U2tIOWhQYWRlTkJLaWRvaHpFMURsQ2VicEZT?=
 =?utf-8?B?UjdqeTZPTStKbU5scnE0L2h5SW5lbitReVlzV0VMdjVoVVFYMmloOTRrNXdx?=
 =?utf-8?B?L3dxTmtzendzNkF1QW5EL04zZUxhTUtrbU8vQ1ZnY0JnUTFNcllheW1qN2Zj?=
 =?utf-8?B?RzV4UDRibG5HQlZJMGs0UjIybE9xNTE5Z0pKQnVFQTBaV2hLbWxiLzFkU1Vy?=
 =?utf-8?B?SWNZSFk4WktjaVhSNmFBeUN1UEV2TTQzUEZPZ1BzM1hmTkVrZzdNZUJORDVU?=
 =?utf-8?B?bWZycDVYSnVUWlpPMkhEMitQdmh4UDh2cjE2YmNNcW05NVB2YmJzYzBaMGRP?=
 =?utf-8?B?T2hXSnlERTBOSnVJNnN3MUk3TElWY2lvMXEyR1Rob2lWYTdHVXBUWC96VWZD?=
 =?utf-8?B?OUFpZC9mRUFRVUZpeTgyQUVOQXg4a0RzR09SaVJhLzBYRlc2bEUrVVM2WjZP?=
 =?utf-8?B?L0U5ejB5ZGlsM3R5Y3JsVk5OZ0VqRU5rZ0pqQ2Y4dUcrSXFiRGVWaHpVcnE0?=
 =?utf-8?B?Um9GR3drRkZaUVl2UEpGOTBUOHcvcmxPU1ZYU0ZHVUsrQlFMUnpFeitWdGtZ?=
 =?utf-8?B?VCs0aDlPYWJvUEh4Q2J1MDdHaGFxKzR5TnJnOTVyQlJUR1hmTmg0K3ZIUkMx?=
 =?utf-8?B?VnpLNGFzVURoeDFMd2pRSkpQSkdkdDZycDhYanFvbkg1elVZR1c2eUpzSWV3?=
 =?utf-8?B?L2wzNzE4RmpsY0huRlIyV1RYK1Y1OWVnazNlRElFa3BNRE4yei9jN3JQV1J5?=
 =?utf-8?B?Qm9tNEpQKzBTaGJ5dERuS3JiV1lNd3JhTEp0ZFBHRnVEVC9IUHhyWTlwYlJm?=
 =?utf-8?B?NmxkSW8vQk4rSFBZbUZUMUtDL3dtb0hMcGpVZUovVVJYU2VRalk3UkVUaC94?=
 =?utf-8?B?QTMrNmFnV1BpaHhISU5OWXNyaGxXbDlGeXFUbGhOeWZBVXczSzNhN29OanBY?=
 =?utf-8?B?YW15RlBwTzV1cFhjckU0bkZYZ09pWDU4NThOUDdVUVNEZ0dOb0UvQ2JCa0lC?=
 =?utf-8?B?b0plM0NmK2pGUER0TUFRME84aDR0dlBOTGQvcTZxZmQ1dVlKWFp0MzlrUTJK?=
 =?utf-8?B?Tk9OdGtRWE1FNnZuSUVHWDZEbXpmcG9keWNKaklKc0g2MERLZEc1TERkU09s?=
 =?utf-8?B?TXZHa1NnZ2h2Ky9XbW5xQXdyYTZtSjI2dXJGNXg3Tis3d1UzUGxScWpFSVZ6?=
 =?utf-8?B?K1hFZDBpZVVKVTh2NTZoUmppMzlnaC9KdHBMNlA2Ylg2YWJzU3lIMFhKVWox?=
 =?utf-8?B?NVRoVjF5ZlBJWklyYzZsMGVYM1JydWUxeGxyVHRWeEVVZE1MczhXVldtdXhJ?=
 =?utf-8?B?Ui9vWUIybG9ESzN6eXZGMmdNVVlzaVhtdTdXMW5ucW1iVTJhQlpmaXVrZlBn?=
 =?utf-8?B?bTErS0VRQnUvSVBGaFI4TkhFTCtpNnh1cEVPc2ZMZDFkZmdSQWJSUmFBU29V?=
 =?utf-8?B?Z2dpNHQ4dFZHcTJJTFgxL0RyUm1VT1h6QmVxTTgwU3NMWnRPcEFJRzdWMlNS?=
 =?utf-8?B?MEJJdzgrL2Njc2lod3kvVngzalNpbFozWUdPVyt4V29oNDhoVHNHb3RSWkJi?=
 =?utf-8?B?clhubEwwOU04eTFWZWtSeWFXRUFLd1p0RzZ3MGtjcFJxcU5hT09JaDhYTlNE?=
 =?utf-8?Q?QOKU4HQ7F3D0w96Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BA72FC506F3DF4BB933D4C6C0EA5768@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rZFnthOz65g6KQKaLOqwi0fLSQAssRtClggAHJbRaZKxBNIhyI+z5EjP4WsgUCb8uJtcgZAiL1zlq8/A6ap1aUJ6fCZqOrSH+vyPxkB/wZsVWrgtOl4liWFHDkUAsHuRxT5IhYLkhoT/WKsp2CUq+u7pC9LQFL68j3F+z1MihJz+IDbF7/JO4dNsuMWPw4vNNB7EsvpalOmkN1/ZRjbYP+p0c4/9aGKhFHfWnrQqi6POrSiwyQa9xqWoCwtn2KNpMtn0ZBUa0Yaxfw2AdLC9iuCT/jfrad/yVipffLBtEMf+0PsgyNgOV7kc0kKnaKx55b0xpzw3lRqnUEy/k6jyjQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a5725e-a19e-4b96-003c-08df468da8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:37:14.6874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJjaxh5njeWg54D8W/0Z1QIZ5EHpf6W8bjCyw5i7V/9BYG7BlFyPmBC9TKWupzczk/JQk1lyJSkorkYS0xAkyxsouEkeCpefd3ojZq7axN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTE5IGF0IDIyOjUwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDEwOjMwOjIzUE0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+IENvdmVyIHRoZSBwYXR0ZXJuIHVzZWQgYnkgZHJtL3hlICsgaTJjLWRl
c2lnbndhcmUsIHdoZXJlIGEgc29mdHdhcmUNCj4gPiBub2RlDQo+ID4gYXNzaWduZWQgYXMgYSBw
bGF0Zm9ybSBkZXZpY2UncyBwcmltYXJ5IGZpcm13YXJlIG5vZGUgaXMgaGFuZGVkIHRvDQo+ID4g
YQ0KPiA+IHNlY29uZCBkZXZpY2UgdmlhIGRldmljZV9zZXRfbm9kZSgpLCBhbmQgbWFrZSBzdXJl
IHJlbW92aW5nIHRoYXQNCj4gPiBzZWNvbmQNCj4gPiBkZXZpY2UgbGVhdmVzIHRoZSBvd25lcidz
IG5vZGUgaW50YWN0Lg0KPiA+IA0KPiA+IEEgcG90ZW50aWFsIGZpeCBmb3IgdGhpcyBpc3N1ZSBp
biB0aGUgZHJtL3hlIGRyaXZlciBpcyBiZWluZw0KPiA+IGRpc2N1c3NlZA0KPiA+IGluIFsxXS4N
Cj4gPiANCj4gPiBUaGUgc2lnbmF0dXJlIGluIHRoaXMgY2FzZSBsb29rcyBsaWtlIHRoaXM6DQo+
IA0KPiA+IE9vcHM6IGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCwgcHJvYmFibHkgZm9yIG5vbi1j
YW5vbmljYWwgYWRkcmVzcw0KPiA+IDB4NmI2YjZiNmI2YjZiNmI3Mw0KPiANCj4gVGhpcyBwcm9i
YWJseSB3YXMgYSBzaW5nbGUgbGluZSwgbWFrZSBpdCBzbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UN
Cj4gZGVzcGl0ZSBpdHMNCj4gbGVuZ3RoLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchIFdvdWxk
IHlvdSBsaWtlIG1lIHRvIGZpeCB0aGF0IHVwIGFuZCByZXNlbmQ/DQpJJ2xsIGxpa2VseSBuZWVk
IGhlbHAgbWVyZ2luZyBzbyBpcyB0aGlzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBmaXhlZCB1cA0K
YXMgcGFydCBvZiB0aGUgbWVyZ2U/DQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IFJJUDog
cGxhdGZvcm1fZGV2aWNlX3JlbGVhc2UrMHg2Zi8weDgwDQo+IA0KPiAuLi4NCj4gDQo+IFRlc3Qg
Y2FzZXMgYXJlIGFsd2F5cyB3YXJtbHkgd2VsY29tZSENCj4gUmV2aWV3ZWQtYnk6IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiANCg0K
