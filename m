Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020109.outbound.protection.outlook.com [52.101.196.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C73EF0A4
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387829; cv=fail; b=IdjkTvm92M7Bvdk1rdJi9nArWVlk8qCJqs9wuTerBroASYk8XWdDYr0VW+vyIFs2Cnwrjxq4W7SYMZmyNs85ksdWeunHqZRoD9w4QXTi3XgJTyUC2WCVm6SJTjHhZYxtcj9zvbosSmr9qp6sWI+2zXUqV5Jh7NXD7PyFP6LRl+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387829; c=relaxed/simple;
	bh=I6lEHtKldafiCF97fhyekSH/A6j6cjLQnFrZa+ShPTA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=VkgGKugXHfCKNzIVxs8xJ0HOt9flFI9LNPp71hfWPGHHaMa/cr1LsxK6Ak2I/DQmQczr15eUCBQEMINwCzj8me/HNUrwkqzJrAVEPwhQaY+4hIwvBNsZhM3ucjwhU/A7vmQsJZ4XBhtRnFwlqvyBxPage84XZPBb7Cy7OZA4hiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=T5+Be8IH; arc=fail smtp.client-ip=52.101.196.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="T5+Be8IH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8qbZIaZDSs7BkNzSXvnodO/LS/1a4K7tacywzAj0wfbAjAGM5uo9FqgXa2dhtLO4jF1BGIHUHdCkxwzwGCC7dThaDQ32DIu5c7vQbshryTzyNJvGFPbbMKAq8dbUBJGDUum4LVPAP3Sj9jQmpUKBQmdxLrvht5iA7njxWaOo1k/WEcO+SQ1XpAaNf234n42AfTi08Dlqt6gxlQrjedOAlueiMX3JMI4MYRuvhAVF2YnY45trHTELQ7ANkL6JbcepwS7v0iDfo94drqz6mi8Z8AMQPOIh4kfLro323aYIXjGWwKcIw2eejqgEzug0iICPApL0XstKvv//wK72Wm1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r08bvSY7SKzOlXfQHcgHC35KRixc0DJZnDHjoCCek/4=;
 b=w/4qGSRYBu99kpNLhxtvy1ZTog4kxfR8T2AwXlPyPLiRwep6GVrRPprYNubnB7tc9hpQdZA2VBDlKInLh3wXTXIsEH3wkDvKCJ1QTDOawt3H/ZUZvnFXe7Vbu4CVMq3o7N5Uw2rQvOhwMiNP0rnU2/PFl663zQZSzkQPzL9zQi2k7drISEkD5rrKI5d3UwIoa+eIR4qYDemn7x8W1icYwH4+nkjpPgBQVCrO88ffu16DuFkNcDRiJ9RdbVd1W5yol26JkjvIu3YtmU72/7WsvZt13YoTvGGbNV9R3X1qry4ShEjt5DjTsvQafrxb/ku55xtP+HllLyQmWYeJWNoF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r08bvSY7SKzOlXfQHcgHC35KRixc0DJZnDHjoCCek/4=;
 b=T5+Be8IHmuUcabTNKegSqjegSqekhsAiF4F46sHuIwexGc91FfJikOdgkqeMr4260VsDX5nADxmp+YNY0pJdewrmzowMaHNzH61T8s67p3zoRf3e+cleLkupHcuJQrx16w6PVBU8ksauhXRXtttdEjId1w/wFrKXYaa0ghYJGz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3059.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 14:23:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 14:23:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 14:23:44 +0000
Message-Id: <DG7Y3UT2VT41.1WC83IEOWJ2UG@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
X-Mailer: aerc 0.21.0
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com>
 <2026020633-foe-etching-e464@gregkh>
In-Reply-To: <2026020633-foe-etching-e464@gregkh>
X-ClientProxiedBy: LO6P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3059:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ed314e-3a54-42ab-c752-08de658b55f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2M0TFlQWnhiQnlmaWxXd0ZuSFljajZvblphejVEVERtVC9DSXdrbm1seUJC?=
 =?utf-8?B?a0ppZ3BlZU5wT0ZyV21LMTg4b3FiT1FzMU9WNS9CRFZmVkNxdDBGdS9rcndY?=
 =?utf-8?B?M2FRdjIyZnRoNC9lSno3UGozTXBVZ1EwSldzUW8rMUgrS2Y5SFRCYTUxOUo4?=
 =?utf-8?B?eWpxSkFqUEdPYnkxTGdKbk9Zc1AxSTF5bXl6K3IwZ2R3TEJFRjRuL01hSTJM?=
 =?utf-8?B?S3dFa2ZpQkVuN2ZWdnNEbHlNdWhpRkJ1YW9zZ2FNQ0RqUkxld1Y0UXdiYU5N?=
 =?utf-8?B?OWtVbzB1UDZNbGI2S2o1blVYbnprN0IydmVCWmpKdk4zT1dtREd1MkdJK2Nm?=
 =?utf-8?B?bUQrbnFsT0JkejZWRXorbW1nT2VZR2ZWRERWRlQ1V0cwbUEwMFJaZGxtMkw2?=
 =?utf-8?B?MTRqc0Z0ZVdmdGVTMUQwUnpCM0NTY3hoSm51NlRvNWlRV21EUGtrZ1RtbnVH?=
 =?utf-8?B?K1BRN2JTZzdhbjEyckxwNmpBZmd3cStDV2lFNk5VWE8zV1A5Y2lreDRKWlg3?=
 =?utf-8?B?aTNwSWdHVTEyUmdsaGY3S1Q5SDEwVnliSGFRdCtRYUU5M0xNVWRWRHBTc2pi?=
 =?utf-8?B?bFBqWnB1dEVhSjVEZE1PRk1JZHNPcS9hbVJ5cUxYTEtwaG5VNnBZeXB4d3VW?=
 =?utf-8?B?OTdnQzZrK1JjS2llTEdMMzY2bDFUejVaSGs3V3I5MEhGYVJqYXhwRE8zQjBR?=
 =?utf-8?B?VzVQMFpaRzdsdUl6NFRHak80Ky96U1NjUjFtL2QycXZBelFLU04raXVoRDBi?=
 =?utf-8?B?elBCaHFXNlpGdGVsSitIaDRjNGl4R25zVGlGS01LU0RDZnlkRFhHREltL2lL?=
 =?utf-8?B?eDNkdlRERzkwYklMb0xCRkM2STludUJUNkI2SlJGd0JyVld6dWZsWkM2MWVS?=
 =?utf-8?B?b2tQZ3JtdXlHKzhOUEJ4RTVhWm1NaHZxUnlWZkxLSFhwT1FScDJqRm43RzM2?=
 =?utf-8?B?aW5FS2hwNUZicTdhUHVSZkRNREQwQ0pBQVVSSWtDOVI2RTJFUkwrQ3JIVGtv?=
 =?utf-8?B?ZTJRd3dzaU9INXRmMEkzT28rQWxrMWJQNG1nY0pnMFhJZENuNWM1VFZuSUdv?=
 =?utf-8?B?cU9kTzA4U05vakxlQ1drMmZJRjNRSVdXS3M0TE10SC82aWY4M2VHaXVSQmp5?=
 =?utf-8?B?aG5pVExHdVpIcVZzM2VJd0k5R2pTWE00YlhkTjBCbVlUS0FqaFJMbnRCWnBF?=
 =?utf-8?B?L0FSVkFKbHFsdCtDRmdWL05QT015VCt2TjdQOTRQQytvSlJOQ3VmdG01c21x?=
 =?utf-8?B?dUJSYlptZG5meTMzK2Z2V2xFa1ZRTW5CTCtKcit5YlFnem1IVkEwdGh2b3cr?=
 =?utf-8?B?QzFUM2Z6ckQ0NFllNlUrZjhkbVp1dW9iSnJDNVdXdU5MZnZwMWlQa3dtQ3VR?=
 =?utf-8?B?eFdZb3pvSjgxWXVzWVJOWUo1ODk0R2x2eXZwUUc2QS95Ti8vc3F0SWdkNzF3?=
 =?utf-8?B?SzMrMDJxdHhzRnloSVBpV04rWlNHOFhVUmkzcmo2RGlNYlFVMVUvNk9scWZz?=
 =?utf-8?B?aHJNWWRoUDFKaFFSSy90dlQ0RUNVU3pwN0ZEeGRna21pRS8rZTdSWFBWUGJu?=
 =?utf-8?B?MksxRWJvbkdadFBPbU93cHhlemxnYzZON20wc2Z0bEVLbDU4K1BSMTR2Uk84?=
 =?utf-8?B?ZzNmckNuOWY2aUNabWNFWEpQTHZEbzBIQWJDcksrV0ZqTXBsNGNESlpPMUNu?=
 =?utf-8?B?cWh0K284TitTdTd3VXhMSktYZnMyUlpEOHVtQWlYSFpTYjhoSXRlWTNEamt5?=
 =?utf-8?B?cE1LMmlYUHpHUlVxL1loeko2MFhVKzA5clRCY2NvY0paTXZxN0FJZGVIUGhJ?=
 =?utf-8?B?OXFyYTZxaUhWNHRUakRJUWlSdUF4Q1Q5K0lhY2RSdTJQL3lNSUtKM3pQU3lr?=
 =?utf-8?B?d2lNSTljdUp3TlJYU0RNSkJzd2V0WGo1U3l0QTRxdmpvNUozNEtPT3VmT0lo?=
 =?utf-8?B?cVRYamtGTlNBajQ4VTRhMStSSEgwU1FwSEpnbVBScWx3T01FNUJDcXY5RFFO?=
 =?utf-8?B?NllUaklVN1BuaGVERi9xNXM4VUV5ekVDdENRaHlPYmw3ekdJWm1hd0UxREpN?=
 =?utf-8?B?cVNibkNJMHRic0tyUUNRT3VlYU12bmY3QkRzRjVUNGhJS01pZjg3ZXNUQjZj?=
 =?utf-8?Q?EZNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFBvTGtNOXMwRnZnVThNdndiYTIxQXlqOHliQzhiQWw2Ulk3dVNGNWl1MDhE?=
 =?utf-8?B?NENyem5VQ1RWdW5RYkNtYUduWDFRZThjazZsZmxZZUdCREd5b3pqcTJlbUZM?=
 =?utf-8?B?S0ZwbCtBVzFyMHdabkREYVlpV25TSmh0MlArMUZUSTg0SGY0ay9jVlJ1OVlG?=
 =?utf-8?B?SFloOEV3d2ZKQUp0UVIwZUlYSjEzT3kzR2dCTEUxZXNub2xkWXRUdUxzM0tC?=
 =?utf-8?B?eXJoVUNJRjByK3crYVJac0dpVGZXYm5SbXprYWtXc2pXRktiYSs5MDlFOTEw?=
 =?utf-8?B?ajZFN0YxZUVXZW5XUktkeFd0UGpuZllFQVRRenpkTVI4UlRzSFo3Yzh0YXN4?=
 =?utf-8?B?MWFMb3IwVTNvamdsZ0lGRDY1ZjJGc3pVRFJIZUUwc09rdWYvdzYxOWdWbE1Q?=
 =?utf-8?B?WmRNMUU3YUFBb0VheWhhM3owWnYrYkpYZWlJUFhZZWorOUV3Sk5MWGZGVzdV?=
 =?utf-8?B?UWpTYzhnb0lhbk5WRkRad1JqT0t5NkhQcktORDBWMjFaeWQrb25rTU8vckVN?=
 =?utf-8?B?MEFhOEZBTDk1a3VNSnVKT1JwdUtmcHVUMXIvK25vVzZJdjVVY3V1YzZFT1hm?=
 =?utf-8?B?ZUNWY0dNTWppQVBwSnczVlh0dm9TbDVSNG0vVUNYeXZrVlp0bzRKMml5a3k3?=
 =?utf-8?B?dU83VnVhak1SaTc4Wm5VM0k4T3dmWWo5NzgzTUZkUXJubkw5YnlYYU1MS0xh?=
 =?utf-8?B?cnhpc0x1S3FvUjhDVVIwM1RrbXlvaUhvTHZvNHdOcUhHOGJpTmZjQVpkMDh1?=
 =?utf-8?B?ODZPZTRQeHkva0w0aW11dndqUE5VL2NNcFlNeVZjSFdXZGk3U1R4ak9zNjZZ?=
 =?utf-8?B?VCs0bWtYd2swRVdROUZIaE9FUXV5N1I4Y1AwaG9reVJVSWs3am1OQWVpRjA3?=
 =?utf-8?B?WFZiMTRRcGMzM1NMZ1hlVjJRTUczdVRiSzZoTnVWNDd5YkNpQ2haVFJBVkdj?=
 =?utf-8?B?amxaTTF1S1VMV0xlOWtGeS9vV3ZDYUZjWjBESkV6Wjh2SGNkZmxjdmh4T2FH?=
 =?utf-8?B?bkFvenViRlRGUSs5b1NRTkkyQ01lbUZTZ1R2WjZUV2tzQjJERVgvT3VuN0dp?=
 =?utf-8?B?RTlZdXlpcUdnRFE4akFlNjZxMjEyTFJPY3g3cTh5RkdlNFNtaFpodGl1Tyty?=
 =?utf-8?B?VHpoSE40Tk1wTDg5YjV5elYwejB6bDdDSTBhREtDQ0wySWxUUTlJbG9aOGk4?=
 =?utf-8?B?bTVNVkltQlNqRmJYNEN5V2pMSmV6RzExVDZ1dk1NR01NN3NqbVloTTZxS1JU?=
 =?utf-8?B?UU9aVFFoWjdleG8zK0N0OFliVVlCb3NzaXJYb2NhTGh0dkk3SWlUbGJUakFk?=
 =?utf-8?B?V2tyNlBNSUVHY0wrWWxUYzVmQ1FDYllSYVdVVklGdDc3b2ZqSkhHK3QyRW5s?=
 =?utf-8?B?Z0MwS3lFQUJhRVprR0lCeUpRNFlpN2k1QjZOcGl1MmZ4U0ZCd0VlZzBYakg3?=
 =?utf-8?B?TitCazdJVHpQeEovOTBYUElVQjA3VnFkKzI5NGlMelBscHlLM0RDbTJXUm1q?=
 =?utf-8?B?czJtcW5tSmdwZkJhTU8xbUN1SVlVQW8zQ282aUFKenRwSk9GbWFaVThGRVV1?=
 =?utf-8?B?QlFJME1jK2UyWElYRnZyMnBtd2hndFJMTk40TzZRTmxjSVVIUGxyYklvbWth?=
 =?utf-8?B?MTBIK2MwS2FTZG1hdjdObTMrWC9FdHZJZTFwR2c2SHdaNklCOEs5SENhYzdS?=
 =?utf-8?B?S3ZHZ21CTjVoeFJDaGlFWVFnU1VoQk9YL3dVL2R4cjlTU3BSMFp6akhNbXZH?=
 =?utf-8?B?dUhRN1hqano3VXp3RXp3SFRXMEtacUo3OWMrbXRNeHlKblNkRlBjSW44dkY1?=
 =?utf-8?B?aGZlbko2V1ZTR2xIdXVXbkF0dU5sc0E1QTFJZ1ExWWY0UHc4cjIrU3QyVzNi?=
 =?utf-8?B?ZWxUNHFqYmNldFhGUkczSWk0R0FLTTFrY0VHMGtZNDg0cE53ZUF2WStCd1Zh?=
 =?utf-8?B?VHVDWmFoUkJHTjFjWFV6WmtBN2FIdGFBekxzaStMeWZHU2c1YXJKQm1EVFJW?=
 =?utf-8?B?QVcvbDhsbWNXRUtXYTIzQ1FIbHRkQk1KZmRHSkdMSVc1RFc3YUxLZm5JOXpI?=
 =?utf-8?B?M2VrL1J3OHFuNTA4aThldDRDZDBWak1HWkpqZE5IL3I4b1IwTkdmS2poTkJR?=
 =?utf-8?B?aXlDb1JIV1RDcGxuekV3OXBZYytiTExqYTRzdkhTVmIvN0ZydU15M2tVYWg3?=
 =?utf-8?B?TzNWSkMxNEJ1U25OcVFjU1BZSEFVUXJOa2pxYUMwaGxxbFRVSE1ORS9vUjQw?=
 =?utf-8?B?U0Y2WGptUzI2bmxGQ2xDcjJYV1ljR2xWUHVEcGxhWnpjUTQzS0pFR1ZMZkIw?=
 =?utf-8?Q?H3j2WtjMj4MkwpL2cR?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ed314e-3a54-42ab-c752-08de658b55f3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:23:45.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut7gTLN7HCYUQsYpz41xsQm4Z4Ex/dQknKu9Tcsy//ap53uyK97wHXyjOFQmxeYEGtSjwqDWaVvI98vdts4WoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3059

On Fri Feb 6, 2026 at 1:55 PM GMT, Greg KH wrote:
> On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
>> On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
>> > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
>> > > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
>> > > > That's fine, because the rust driver core code should also be buil=
t into
>> > > > the kernel, not as a module, right?
>> > >=20
>> > > Yes, but the Rust compiler may still choose to put some of the core =
code into
>> > > the module.
>> >=20
>> > What exactly do you mean by "the module"?
>> >=20
>> > > Especially with generic types and functions the Rust compiler may mo=
ve some the
>> > > generated code for a certain type instance into the module that inst=
anciates the
>> > > type.
>> >=20
>> > Ah, that's a mess.  why?  The code lives in the .rs file in the kernel
>> > core, right?
>>=20
>> It might still be inlined into downstream compilation units. Rust has no
>> equivalent to 'static inline' function in a header file, after all.
>>=20
>> > > For instance, even though rust/kernel/devres.rs is *always* built-in=
, we get the
>> > > following error when devres_node_init() is not exported when the use=
rs of this
>> > > built-in code are built as module.
>> > >=20
>> > > 	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] unde=
fined!
>> > > 	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] und=
efined!
>> > > 	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core=
.ko] undefined!
>> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undef=
ined!
>> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko=
] undefined!
>> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxili=
ary.ko] undefined!
>> > > 	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>> >=20
>> > This feels like a compiler bug, how is the compiler reaching into
>> > devres.rs and sucking out code to put into the module?  Doesn't the
>> > build/link boundry stay at the .rs boundry?
>>=20
>> It's quite intentional.
>>=20
>> It used to be the case that only functions marked #[inline] could be
>> inlined like this, but it was changed so that small functions without
>> any marker are also eligible for inlining. Now you need #[inline(never)]
>> to ensure it does not happen.
>>=20
>> Note that this analysis only applies to non-generic code. If you call
>> devres_node_init() from within this function:
>>=20
>> impl Devres<T> {
>>     fn new() -> Self {
>>         ... devres_node_init() ...
>>     }
>> }
>>=20
>> then since `new()` is generic over T, it is duplicated for each type T
>> it is used with (via monomorphisation, like C++ templates). So the
>> actual `new` function might be instantiated in the crate that uses
>> Devres<MyDriverType>, and in this case it ends up in the module even
>> with #[inline(never)].
>>=20
>> So you'd need a non-generic Rust function with #[inline(never)] in this
>> case, and have Devres::<T>::new() call that function.
>>=20
>> > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not gre=
at at all.
>> > > Hence, we could do something like in [1] instead. I don't know if th=
ere are
>> > > other options that may be better though.
>> > >=20
>> > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org=
/
>> >=20
>> > That's a start, but still messy.  There's no compiler options to preve=
nt
>> > this "lifting" of the code out of devres.rs?  If not, this is not goin=
g
>> > to be the only problem that drivers run into like this in the future.
>>=20
>> Because of how monomorphisation, as-is the code actually lives in the
>> module to begin with.
>
> Ok, but again, that is going to cause all sorts of "the symbol is
> undefined" type of problems going forward as a developers just "assumes"
> that the place where the symbol is exported will actually have the
> symbol exported from it, not that this place will be copied inline into
> somewhere else.

Note that this won't be an issue for a Rust module to reference a symbol de=
fiend
in Rust, because everything is EXPORT_SYMBOL_RUST_GPL'd (we use language-bu=
iltin
visibilities to control whether people should access an API or not).

For APIs intended for general usage inlined through helpers, it is also a
non-issue because everything is exported already.

The issue is only when a subsystem wants to export a non-public API for Rus=
t
abstraction to use. So far we haven't had a need yet, Devres is the first o=
ne
that runs into this.

Best,
Gary

>
> Think about the interaction between module symbol namespaces here.  This
> isn't going to scale, and will trip people up and cause us to be forced
> to export way more than we really want to (like this patch series shows,
> I don't want to export any of these...)
>
> thanks,
>
> greg k-h

