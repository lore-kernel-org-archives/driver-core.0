Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832684;
	b=tQAkCSLrmEXUMlgxpRbN5tAAkBUIbx5ML473Y+WC0BYTPnJ1K+wAcFv7aWw8acabkJbg
	 dQUsihNTMPEgcjM6a4DXMLwGBTrxc09j6rmIKzdoOiH14bSiehnIO5medY7ErXe3xKCHX
	 VdzrujIK2OOs6eiFvRNlwxRj/MdXdXzwPU21JT+ROea8voB1Q49izPfHukoh6sDcFBhVy
	 6JluFCZbkszBu2UCCpPtOxuCCwh+1MfnBsPHfTbc1IkjgqztNraaERB9yntWXwltG59J4
	 igtA6Ehn8wCEWrrDFjznE4PAo71LTbbgYCW8FNkvHXyKELDmrUkDrjliGhVMFVzHp+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832684;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=JXs7rXnPJDu41YhM0NmG4I7eABOeDYPLKKoC+NhaJ0U=;
	b=0Y0E8iA5lv54hwjgisawEGrOXy5A0lrLNvaiDQeECbQZEQrEP0dyd3dahYTiE5aNk4YS
	 ysGV5jNaIpqsHqKvr4IXhWKT9bi6xm7ngW23W+rfC5AkGXZM/ZGr0GyNHyKyy1CGb/bF6
	 BhaASLc33is97R+NpGEMJQxg09lEW2jIpd4uyCnLUuyM2F4BBfKbd0FSHJ6YuguNQupII
	 fL9AgLv8BWkUwVzppm8SxZUhlzzKyDknULUrXJMJit/nJcGt0oQA2xTtvaYYZGwFEa1+u
	 ovEaJpzJv15AZVsZ/UWfv5zhq5ulDR/7QLMtXC3uBlNQC/iJCrP5doxaZ3vLjTAh7/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btitM0bN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7868606A32C
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7868606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btitM0bN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793832683; x=1825368683;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JXs7rXnPJDu41YhM0NmG4I7eABOeDYPLKKoC+NhaJ0U=;
  b=btitM0bNk+ajNsXgL1bGMuvpo95pKASrDOPzGdjESYBj6xHQp8N2Q5M4
   WmyrmIwy8yo7oUsQS37myBLOJOU7oxO7VJPPN62Sb1o4vJ/AoYSXAq9Ui
   54nsnKpJF2CjiW/7i4+Otexj5YAXHMILmBcRr3shrqLn3ZXm4zF2/O5hy
   iwfqHU6CLlYUCTVZQ1LTeJvpJFDJj8XDnRujVlNMXPgB+3gr3zXQh+V76
   aq98HWOOW93K3L9VFF0z/dqVFRqpT4POdoMz+3gYgjX9vNTL7NQ+XtxX8
   ts+OWukPjdPlSVK8B8MpqAIzfvLMj70H5dYPWGn6mcarW5nvAWcZfldRB
   g==;
X-CSE-ConnectionGUID: J2YPoBnNRVWp3ebgvdka6w==
X-CSE-MsgGUID: CgDE/fWtQIWFoDXRxatd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2478939"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2478939"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:51:22 -0800
X-CSE-ConnectionGUID: XKwK5TXoTlGNbVg/WHU7xQ==
X-CSE-MsgGUID: YWFnWq+WSlCylBjI6d33Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6842839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:51:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:51:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 14:51:21 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:51:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMHubbw+IgVewIplr7df0sGPfptd0nTBCBlkWVOXl1nqGSzCZmZ5qw8xgH6L3G95NtNXOj7HsHipcfB2J50UU0jlcVmbsbmzjOnai+AkY38Iz/jXovRD2gu/5fB2TnQ2ZjpKJV31cmiw3R5AWlgtuF28kazwNKH6pYQBOZrgq84pqUSZ2wODjwWeYrwAoXR8lCy+MUn7E+0Hp3d4pppp4l3AhwGAihdQhHAhw4Tp/I42BefEcDoMeyZKd38RxrzqM1dN3/3xDpmHdmyHTHghwS1ex7qxGArY+l4d6CyYDCtXIi5KHKNB4FQeh4qyZYTFb9/QyMf6fCJQW2NOLYMk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXs7rXnPJDu41YhM0NmG4I7eABOeDYPLKKoC+NhaJ0U=;
 b=Xynf3MxwbLlpIzQVpANvpqMmEaGBQDmQiC/ig0+HfHtLewP4yqVAJpeVqh4Qh/Ho5y8nYb2BSMURwqS9Spjaa7MI/15JZFCE3VBgNHOXbgw3Je3TCf5gFNSOOnV+F8nu+gkv07LUzShdQ2B9idwQ/hsWzuFdJwVNSspkFQiq+tpKWQCkvROJoAKJatLcF8HtL2fKE3/ypCpPi6qFYutxA0VcrzhgduQNuVUVROjjxjugAMpABbq/PdImi5BGp/rrKZpw2k9teNsmw2K2QvORf9HlRM8JE2otE9r/fIcdpHUCM2VdDut75hfsDJNAChknKDZKDqO0qJRsgxfBp6HTIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by CH2PR11MB8834.namprd11.prod.outlook.com
 (2603:10b6:610:284::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 22:51:17 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 22:51:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] driver core: platform: tests: add a shared software node
 test case
Thread-Topic: [PATCH] driver core: platform: tests: add a shared software node
 test case
Thread-Index: AQHdbJqC+OxfSgBQGkKFhGWbodv4zLced6mAgAANIIA=
Date: Wed, 4 Nov 2026 22:51:17 +0000
Message-ID: <6b9b54ab03919b3a395b0fe404a42aea54989c82.camel@intel.com>
References: <20261104202419.30180-2-stuart.summers@intel.com>
	 <auur4ZlHSB97uiKH@ashevche-desk.local>
In-Reply-To: <auur4ZlHSB97uiKH@ashevche-desk.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|CH2PR11MB8834:EE_
x-ms-office365-filtering-correlation-id: 645450bc-30f2-4b5b-af5c-08df3ac622e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|18002099003|22082099003|13003099007|38070700021|261102123227099003|11063799006|56012099006|261021135927099003|4143699003|261021121427099003|261028144727099003|261021123027099003|261021130227099003|261026135527099003|261022113327099003|261022075727099003|261026121527099003|261009223027099003|261026140227099003|261022105027099003|261022115727099003|261026130827099003|261021133027099003;
x-microsoft-antispam-message-info: eNy7o1F7UaROeUUul/XDYqDeMmecM1+WQS6fk5JOyv1PHlBvnuHQW2kbcuRbo8ZtyW5abX9JMMw83ryvKeFllZ5H/fEwhhDv7mJoIpHmURe9CtIPZAeFOdvXFCgcrcNvFxFP2iUeIFXYzuXebUo2WJZ7iq3Kan2o1JsatzzyUYkpQpAkJ1DIu2NG6QO2WcJvyImveIE1cTlVNgFTSikrjGs3pHhEu05lBYzYAwbS5B9WXGBTSKf91X/FtOTW67KAmy9Eusarx+EomH5hBfglhCpys3id8i2g8poGoBIB9XTzm/xaqLtBbyo4V+R8Xw+kIE1fEISqGf4cx3qEDWgu5guFVa+VUgZO8yWh5bkrqbMqQDbXKFMw2XZp7Mys9gx0KmsOjBJ8cTiJYOaxQU1WA8rEdYTdXqi0mEOTRLAVr63P48eF9Qyq/FUTrthXBxZXj2AWA1eR69EjV4xYJWemGTq8dQKaRpZc7k4oLCOms+ttjHQNlzq9wbuQyUi6qA4uyEQGwJHLket4Cb06JGNDwj7+kP/hvgnTc5N1onHeqZZQ95EyBbRlFkL9MtKwYLuegQJE6Fq8I6acNRoEE8dT5o760dCFyR6Lxu8I2W8gM0F3hbS1C3Fl/B5WCXN4KRn+EtnW9UQtvgNNK/eZIi7VqDJf+XBMfOQLHwahBPEFnzM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(13003099007)(38070700021)(261102123227099003)(11063799006)(56012099006)(261021135927099003)(4143699003)(261021121427099003)(261028144727099003)(261021123027099003)(261021130227099003)(261026135527099003)(261022113327099003)(261022075727099003)(261026121527099003)(261009223027099003)(261026140227099003)(261022105027099003)(261022115727099003)(261026130827099003)(261021133027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0svRmIrTXRkMWk3aitjK05xaGxDVy81WEp1ZVRvZk9RZDEyNWtvU1M4WlM5?=
 =?utf-8?B?QnpBVUNwRjdDYjllK3kwbCtEQlZiUkg0Q2tRbUV4UW12WWt2TFR1WlZTNFVY?=
 =?utf-8?B?ZlJCZHNSdU0vTUdNdUFwbnJweFBKV2J5MnRwUzd2aGw0dG9MSERwa0JTMjFl?=
 =?utf-8?B?clAzZXNRM2txRmYwbGgvVjNDL0lrWTRoa0gyYVRUSWJNV2dKNWJKK0xyRjA4?=
 =?utf-8?B?Vm4yQ25BbWtrS3FNYzU1MmNJODVPWnJ5RXcralhLUXBJQVZhbmpYZnlhODQx?=
 =?utf-8?B?Y0NheFRrL3FhRjlROTFvSWlHTTJ1TTRwbW5tZWxmUXFWUGt2MnBGSkxYa2VF?=
 =?utf-8?B?RU45bEhUUVFhN0NtaTRkbDI1VGZYcTZQeXNNalIwVFA5N1hMZkZkVjIrRDY5?=
 =?utf-8?B?alo5UHJGdHB4V3dNYlFUNlEwdmhFSitFdndnZEpxNzFqK3lVNUJ3MytmZXcz?=
 =?utf-8?B?MlcvRDk4UVNaZDFoc0JVb3cvcHFMWUJnTkEvRzkzNEcrV2hOdGtZZFIyNnhx?=
 =?utf-8?B?ZGs0aXcrZS9PTGZUNjdUc1UvbWhwTDhVNDlIV0hBQlNTMWN6Nm9CSVBjY1lN?=
 =?utf-8?B?NktBWEpVZWRZaTZHZmdqVTJUUVNBZW9jL1NiSnVpRTh2TXBrMW9BcWgvVWRj?=
 =?utf-8?B?QVplZVlqb2RRVXc4MVJBa1RxNkcrK2J4RVVyWG9MT2dmYVByQjVLemU0cTht?=
 =?utf-8?B?NnJQaTlUUGpPUGhoZWtEellwb3pLOHRPNTA1eUdrdCswalkvcGhnR0JQWXI2?=
 =?utf-8?B?NU5vWFVlMjFyRFFTQnpIbC9LdmJOR1p3cEJ4NEdxR0FjRHNLcXZoUG93Yytz?=
 =?utf-8?B?TDVXMllsOHdRdXVmUU1UdktlZ2pZdkhraTVvV3FnMG9YNEhjczZUUGEyekxv?=
 =?utf-8?B?NEV3T1NnZnNmMlgzalVSdW0xeC9tVmpHUjI0T21TcWl2M1FiOWE5YUZWTlNL?=
 =?utf-8?B?S3NzZTNGN1NLcUNHcWxIY1J3eGJDWGdBa3IrN3gvbWNoRWZwWExBTzdwc2h4?=
 =?utf-8?B?STFQVllFNmNybjZpUXBmNHA3cEpDdVYzZW9UVVlQblRMUVZEK0I5ajZmdkEw?=
 =?utf-8?B?MzRROFVBbTNqVlNaUTlDRVFUWEpVUnVkRXRiNzVBSnRvZ21QL0NTN25GdHNo?=
 =?utf-8?B?UWwzcmVpZ3Z6c0diMG85MzIycjVra29Kelc0RXJYbkZnTkl1emRWMVpoUnEz?=
 =?utf-8?B?Vk5ndm9QZ2ttRVRNQllXb25WVUJYUW1XQUljVEdPSE5VaHZWOTZnZnBYQkxv?=
 =?utf-8?B?VEhaaTYwaHhKSlpjQmNIdGJvWVROcXhyYlU4TVgrU1dhUGVLODBTUmhLS2RG?=
 =?utf-8?B?ZzkzYkZRd0FKOHpmM1F5YUc2RmVGVFdGcGNCMkxxODVXQmFaOHB1SVBxcDNQ?=
 =?utf-8?B?VnU4RUZ1R2NkbzJkM29OekVWUE9oaU9ZWGl6d1JqQWlyckpoRTRiUExUa0lq?=
 =?utf-8?B?MWE4RkdCeG1KaGhCQ2tpNEw3azRNQVpOZnJST0FIL3FNL2JGdndZYkE3NDlW?=
 =?utf-8?B?Mk1oZ2JEUGhnTTFNNUxYWWljNW5KbXpHdkdrVXM1T0FIaHh1TmozYlJCQ0lo?=
 =?utf-8?B?Q0cyU1hzTUd3Z0paODllZDcwdkVqZ3lSditTNndQNDZmWDBZdXZPbzRTVitR?=
 =?utf-8?B?anlmeEpxd2dWejBOT2lZeU04Q2l3ZEt1elZWcHhUNGE5YmhmbVRENGJFa2FH?=
 =?utf-8?B?UjhRQml5Yzd5TllpWXZGYmJIN1FPbTNib3RsdEhTQmFiNzBmdUxkdm40NGVH?=
 =?utf-8?B?aWl3ZVllVzlhYXpZdGV5ZzFkMFladzZlUFZVa04wbHc1V29uaTF0cDZseVpZ?=
 =?utf-8?B?K1psMWRoQVBWek1vY3d4aHJNMWc4QmV5dDN2Rmdtc1dWMkNlQWtrREVHV3l2?=
 =?utf-8?B?K3gxYTAySnlSVWQ1cUdwY3k3dkpoNlJMdGx3N1h1ZmdzYWRBbDIyYlpKS0o0?=
 =?utf-8?B?V1FtYnBQMTErQTE0K3ZjU3NSQXcxdWIvWENOR0VPM2pNeFhReFZpOE4wSEU5?=
 =?utf-8?B?dCtMYXRnMUp1NGg4ZUNvYzQvcjU1b01ObHU2SHFHcWdPYnVUTWxRY3RCQlJR?=
 =?utf-8?B?VDN6VGUwRkY0Yk9oREtTeFh2S25VcUd6dEJoMGNRRnBVdS9LSG5VenBIRlUz?=
 =?utf-8?B?WndsZURQVVVzazFHMXpUUVBML08rcHVwTXY2VXdoUk1VVXZqU1hSYzVNWkZ5?=
 =?utf-8?B?NGt6QStVNzBqYVFtS0Nsbnl3N2xtVU9nbG9kZUxiZnpFbXZQM2pOYm50d3Jx?=
 =?utf-8?B?TzNScFkrVGpabE5CUXViQzFlRFAvUHYvRkxRbndORVZwK3p6SWFQT0hDQktn?=
 =?utf-8?B?QWpneUNmWk9LTE1CcjVTNTZseHcybTFkdTd3MnZLUDdTM3RDUXBYL1JzUGRO?=
 =?utf-8?Q?fRbkq9uhHQlUB9oc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7354A170F3395A4AAC7EFFD25E6008C7@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: JbUfDiKAA5HW9IJj9c7X2i+4hc7xQEuX6RVHwxU+ZR87vR68FMW5HQRlk28MkEOB9gxjkJubShHTaAsbzX1ZRZVzGTqE6SXxTo9omPG7x3mswUMPaDF3L2Ntd5vHgVQORtMzRq+cqebzAQGHgCc98qwV1+BprJFkUyY3mFBoRgUi98JGvORp3HD6LNEG7zB8B2Ggwb/VtsP6t64YHkuW0FV5hi4vC8JjOkqQS5+CdQdMEk0MkqWu6e/23sArLeu6tu2ejtJYsJgojVUldXRU+L7JTON8uvNbyaLKrFFeUEU7Z+N1zQlzSJVeI2WXz/5vVU0x/HVj8cxjnwtsCVQhyw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645450bc-30f2-4b5b-af5c-08df3ac622e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 22:51:17.3283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drM38EbDBoncL5PrAd/jbTRxXPSROeXz4VFYG7FKzMjZtunGuIZRnl+djcKOv4EAXD3BAJhZTjptB1j+R0hLSea/pozQLqTix+IaKFK7I+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8834
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTA1IGF0IDAwOjA0ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFdlZCwgTm92IDA0LCAyMDI2IGF0IDA4OjI0OjE2UE0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+IENvdmVyIHRoZSBwYXR0ZXJuIHVzZWQgYnkgZHJtL3hlICsgaTJjLWRl
c2lnbndhcmUsIHdoZXJlIGEgc29mdHdhcmUNCj4gPiBub2RlDQo+ID4gYXNzaWduZWQgYXMgYSBw
bGF0Zm9ybSBkZXZpY2UncyBwcmltYXJ5IGZpcm13YXJlIG5vZGUgaXMgaGFuZGVkIHRvDQo+ID4g
YQ0KPiA+IHNlY29uZCBkZXZpY2UgdmlhIGRldmljZV9zZXRfbm9kZSgpLCBhbmQgbWFrZSBzdXJl
IHJlbW92aW5nIHRoYXQNCj4gPiBzZWNvbmQNCj4gPiBkZXZpY2UgbGVhdmVzIHRoZSBvd25lcidz
IG5vZGUgaW50YWN0Lg0KPiA+IA0KPiA+IEEgcG90ZW50aWFsIGZpeCBmb3IgdGhpcyBpc3N1ZSBp
biB0aGUgZHJtL3hlIGRyaXZlciBpcyBiZWluZw0KPiA+IGRpc2N1c3NlZA0KPiA+IGluIFsxXS4N
Cj4gPiANCj4gPiBUaGUgc2lnbmF0dXJlIGluIHRoaXMgY2FzZSBsb29rcyBsaWtlIHRoaXM6DQo+
ID4gT29wczogZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9u
aWNhbCBhZGRyZXNzDQo+ID4gMHg2YjZiNmI2YjZiNmI2YjczDQo+ID4gUklQOiBwbGF0Zm9ybV9k
ZXZpY2VfcmVsZWFzZSsweDZmLzB4ODANCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBBc3Npc3RlZC1ieTogTExNDQo+
ID4gDQo+ID4gWzFdOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3
NTg1OC8NCj4gDQo+IFRoaXMgaXMgd3JvbmdseSBmb3JtYXR0ZXIgdGFnIGJsb2NrLCBhbHNvIFVS
TCBjYW4gYmUgbWFkZSBhIExpbmsgdGFnLg0KPiBPbiB0b3AsIEFzc2lzdGVkLWJ5IGlzIG9ic29s
ZXRlLg0KPiANCj4gQXQgdGhlIHJlc3VsdCBpdCdzIGV4cGVjdGVkIHRvIGJlDQo+IA0KPiDCoCBM
aW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3NTg1OC/CoFsx
XQ0KPiDCoCBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPg0KPiANCj4gQW5kIGxhc3QsIGJ1dCBub3QgbGVhc3Qg4oCUIHRoYW5rcyBmb3IgdGhl
IHRlc3QgY2FzZXMhIEl0J3MgYWx3YXlzDQo+IGFwcHJlY2lhdGVkLg0KDQpUaGFua3MgZm9yIHRo
ZSByZXZpZXchIEFuZCB5ZWFoIG1ha2VzIHNlbnNlLCB0aGFua3MuIExldCBtZSBmaXggdGhhdCB1
cA0KYW5kIHJlc3VibWl0Lg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCg0K
