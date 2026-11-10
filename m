Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299355;
	b=jhjC45s0PVkDFq7I7bzX4HnGPKfdNqJvxyLrsg+RLfunCTHr57DdSgCxa1W6mQYGUC7Q
	 Rz36fp3E3x7wtt1fxC4XQ8UQyS4jQDZ++1bd04IOS9bepjfKi9G9i1LXBZFq0/tibdhro
	 gQanxVEEray6Qgd0pcllDO9muG5DcU7TtXWB0zL7FdDC9lmhcEX3VAxTJS6Z88zhxIxBc
	 +DEk/y5wOONxFi0Xas36DkBMyBLmW/tnN7WEBJtIgWKvEpIJ+hWKYcR1rFdY7bQlqEgNa
	 XzlAXFihyQpySnaA5M4i0MLleKwlVi6QoClaVFZnTMCi2cT9Mmm+AjerjDBG5HcEEOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6aaW2ruS26W/iUJQlf/616nxkO7We+j9F/Id5bVu5eI=;
	b=ayucWnxQHjUTUGRhIUqGoeJTXFPXXpeJKqMFdvEQY3eqsyfmjvv4WDS5Kxc/y+UY0HJ/
	 em7ihHjlxaAuMcVG8aqNulc5FRbG/O5kvQwqZMQZLEusfOUzAs/pIu+jyXM1Jp4iHU6bR
	 btqo/8BCt8BR9jhb4XDqtL+h5joxbqk/hW5l5ljwBYJmQoVp7xuEjaN5iNj0DLYaHnvid
	 dA+g6Jezg+FhNxzQrXNa5l5OZ/KZO5BheTFbm1DEu6LeoEgD8QA6bFa7QuDxxF/KwesOe
	 mZkw939JLuvRdZjt6cfGtXp2joircXcpzj3hYdeGvpjM4TNbR2/hjbF+/ZbJl+AVDkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LJtdgQF2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.9
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D9606A33E
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0D9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LJtdgQF2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyxxyvVwcMvU5KXpH2dC8M2aU+6a0HssBgFmanLUX6Kca98uVdxMjhbJNqq4UlzNiYiavqG3eKFFXCeCYX4cxLxeueCMlLX5E6i8OhZO0+CEAVGPMFTd9uG9u4rrgJHIPnwbQv2+SzRwzva8dIIPCGBitISJ2e0Atf3zaoSrKNm2LTM3xlo/SrhXFJXE6uuxzuR6ozxL/1HH2h1c5bkb4mEZpJ2k3jM6eZAz9CeMAwNRL0u+Wv90dh5c6Py/q8+1mJtRlcvWvkazDeIXsC5LsxzJfj1M5tnv5vwSgTZYYob63xWdnLgj4BIPhxMYA+4ZtNRBHx3BZCuAA5DinYqm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aaW2ruS26W/iUJQlf/616nxkO7We+j9F/Id5bVu5eI=;
 b=AlODtRGS+8Q+Kq4mX+NjezopBWfjjGg2067NOyevVuAID8eYEKadJJ5xNkR8J9dFQ+aG4hwfl/WuEMfXe4Kx/sQT3DFCRivW7rYQCEMucelXWAmbS8HTaRAy73nq2UAWKPXnYTESi55X+7MrDDpwJJRLiOk8qw0SvmW1NINWwPr/g4wjbqzTWTQDCJlWGLWXTbVfcAdFQ3pJaUewb9FWhkewb5SALg+1x4/DeXOEEUgt5LEc0QiTv68NLS1gfYY+zRmzlQk4HuQUpE9CfFls2ydIiWGzC55vPP84Fetncc3idlm19hJ9NasDThZCVas4mj5DpONQ3GBnyMuWtGwtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aaW2ruS26W/iUJQlf/616nxkO7We+j9F/Id5bVu5eI=;
 b=LJtdgQF24pQC1uOImHppRazBqdwVmZepvxOP8nljVhZ5U6gA64KkUWIykljzDHHd1133iy+L4YH1Ltb7XHRFe6RMh3jXbgZX8VRDwS7T60VyNRUZa5hzC8/zJlsT7883qy6HJPnDM1hvE42xr8gk3sdSKx1PfJthYArufaUPCMu1rKPnZtMINGnoRy7bepes7XYxkzrQq61yXbBgINmtoEhQmRfOCsQWF/9To0RuphyGrIKHZT6j9WfSGtz5jZJL272pBRrDukVXDvRASShj2tw+Y/euSzN0d8qTg7Ii67DEkY3sN1cQ9vXEepxwE+ilJiY4iJCqxWIl2ZIkcaZ6Mg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:11 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:25 +0800
Subject: [PATCH 1/9] regmap-i2c: keep bus raw write limit when applying
 read quirk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-1-3a76b6c10ec6@nxp.com>
References: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
In-Reply-To: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|FRZPR04MB12430:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd6013c-2beb-4d3c-732d-08df3f04b238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	loicXfpDMo6KUIXUb4cCoiDQYskL7KubEnQkMgbM6uXbjqfg4nEE4XtFMN6xnsF44eX2/6a7FfvveMYQAlLYTyobSRlDu33krZu/cPNUDbzqduCnej1YHLgHwWUTH+GEe/l+5I3EChXeMlxitnyIGzjWctgSqkIyU+2SQZUYWIC6OiHYxDkXicI7kVSaFbYcQsP/rj8L4Kktl6jdmpn/ZOqlDcmf/OY0zvFsuNGXSoe+MVF6gCa68DNE7ZFEtwUcFyJVHlfcAjCKTybgZV6RKNZ9LvMUxfkXb5g00F1iw9TWYkbodo4XaJKbC4NVMX0YHmYOA5LGiN5gVWL/XWITr/rhfK5P5LL7VQeLMi2VFZdhAHe3a2+fy3L1rmSzOSlUynu3qNOCPOYPAwXGZI8HiejNzMTFPnfk+NAwYAbtNpE5ZtkihWonIUg/SQoO5QWcY0TIW/3zwzttCNyt/J/OkQ4JJxtMTsy54sSUn26v55gg5G+Ia7K+93vsu4j6sUWzAdO7JFihYPAskUq6r8SgUKKsyK1jrg2np2kY9LnFCaLH7RFPeRmHrJGa/wLIgvAGuUTqhKTFw/Q9QQVtCtc5KifYFvUfXMsaXfHfmP6TT0nTvD5ATpCWm6KV33EWmaAzQiEOx2n+OpU9zy9FIMQ8ghl764pZyF3Vxu6baVs+wDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERacVhYbWJxbjFoT3FCRXNqcjFFUzF0ZngzTE1uNnBXeC9yUWVwRDVsWEFP?=
 =?utf-8?B?MDV5S3VsNXlQMWUrK0ZrTTBmNWRnbnM5TUFodHc2UXRKNXhiZ3VtTE1uQmR0?=
 =?utf-8?B?WUNiOXExYmk4REJMaU5DSWFsRGFrMWRYTmI0dndhVFhPYlBXUTU3QmV1eWNs?=
 =?utf-8?B?YnJlSEFKaEFKM29uMnl1V1VpblNRSUkwMkU0ZG1ORmQxUlgxWWJGdVFSOFFO?=
 =?utf-8?B?aVhyVzE4bkU1SVZlV3JGWm1JZFUvRGYxbjlaZ2FrT2lzSDVsdlM0RXhzTUM0?=
 =?utf-8?B?a3FKZ1doVU9RTWFJQkhkSEwwU21zbzBrMmg1T1I3NnN5ZUNvQWlTSUR6eEt0?=
 =?utf-8?B?UVhoVU5MazVxVG9hVFZXajB1L0VwUHJyNlJMNEdwV3lLVFJ5Z3dtYi9jZTA0?=
 =?utf-8?B?SUtRSWZsamYya1crSTkxVWg0dmVoVFcvQXNuRmxrMElTbE91eHFlRGpmQnRT?=
 =?utf-8?B?UnZ1c0E4V3pYS0l1YlpvYW1iWUQ1TmxGd1BiZGh0QTROZjQ2R0JBQSs2cUpF?=
 =?utf-8?B?ZDhXanN4MDUrMFBJdUlVY1pjS2k0bElZMlpvZlhQZjNlSnlFSW1pd1lEd1U3?=
 =?utf-8?B?R3ZQM2hKdVJOYWNOTlAzd0dOa0pOenZ4Ymx0T2M4OUZNdHIyeVJDUFBnUWlC?=
 =?utf-8?B?RHdQRlZDcytmcUYzVGI3cDR1OHArcS9CS2ExckdydGpZQW5UVnAwVEdoa3I3?=
 =?utf-8?B?SmUwNDltT3MxK1g4U2NFb1RBY2lGaXIwT2FMaVNJOFFIdGdmUnFjRmtOd3Bz?=
 =?utf-8?B?c083Z25PU1FReElpK243NzZOVVVLZzc3a2VkZGJaMHo3OUxzMzh5OTd0amZT?=
 =?utf-8?B?SnRMeFdXbXMrVXZuOWlpVEYyLzgxWWRXMVR5eG1FRlVEZGhmMXhvQ2x4QVFi?=
 =?utf-8?B?YWJ3L0JMR0hnQ0VyUXBBdjMxYTRRS2lSUlF3V0piREFnd2JhZm9JVEFIaWJO?=
 =?utf-8?B?N2lCWGFMSzR5aW9wZ1c2cUlaWkMvTHFWQjM5TVVDSmFMWVFBVXRwUjg5cjJL?=
 =?utf-8?B?aXU0RTZKYzd1UFRIYjhubTQ2cE9EakhDellCb0p0RkVieCtaR1dvT2FhWDl2?=
 =?utf-8?B?VkVVbnlDaEFDbUd4SkVja0xhNjI1N2ZSTlBKNFY2SWRUNmxPbUxab2JGbGk5?=
 =?utf-8?B?Qk1Bd2xiRGJ0QmYxQVpaZ3I1SGJ0QzB4MkxiRVFocTRiRFNGU3JFb3VidDRG?=
 =?utf-8?B?WFZYS3V0cDEvNWhLMk9LVlFtaFdsZ0tsTEtnbHl3MElPNjd6UkN2YnpWR1l0?=
 =?utf-8?B?L3VUMWpHeHBvd1hTcW1SOVBIamd0RzF0a24wK1NnN3dQaWhndkdocDEzNnR1?=
 =?utf-8?B?WFp2dmFlUW95bSszZnYrcnc2Y0NGTEFRY0N0RU4rRlF2RzRTN1AwRkhIT3BH?=
 =?utf-8?B?L2lvWWR1YmJwSEFGNUJheWdPRi94OW1UcmZ1dlpUVUxUbVJZMHZLd1VVK0ZM?=
 =?utf-8?B?V2lmZENvMWsxS1FmdjkvSG5SdjlBT1pHTDFlb2xBeWIwN3JYL0taaXV3aGI3?=
 =?utf-8?B?djdUNC82VGdFcjBPbHA0UW9zdWw2dGlsYitHWWNlTUdDajRyRVlqZWxrZEdP?=
 =?utf-8?B?cElBQmRtQTF0c1A4Zk9lVW5FK2ttN1MvcEMwM0gwdVhhekxjVDFaQXBUempy?=
 =?utf-8?B?Z29oVlJEU1VHL0ZPOG8xQVRhNm96aXdURDhNSnQwWERpR3pUUFpqcjhQelU1?=
 =?utf-8?B?SVRFMlFyZWV5NXFoeFI2d3creVU2dWtqOTVwckhQOCtyeEF1UWdmWXUybXha?=
 =?utf-8?B?S1diM29EOUtnamJpM1RyQU5kV0NiaEEvRUlhK2FYVzBsakl4WmdGbit2a3Zt?=
 =?utf-8?B?RGkzOFU0elNDN0FFbjY0VkpEcnJyaEdpN0RkYVpFYmk5ZGtCbjc2MEVhYyti?=
 =?utf-8?B?SEV4QnJMNXJsNys3YzlreWxzaFc1YnUzaWFqbXRpRjNuaEZPVnFSOG1jRTRl?=
 =?utf-8?B?c24vQWl4OW1JZFd2S0NXc3hpT29DazJ6OG5WNnBjRjdKWkYzMm5hYk1VODZR?=
 =?utf-8?B?TUQwb0ZGR1NEQjdCM2RBVE9QOFQ1U3lGbmtEemF5SGttTDM2SUdCZFNmdmpo?=
 =?utf-8?B?MnNSUWpqc2hWY3dQYUVySS9qV3loREJXc2tlaE1IZSs5SkVCaTNWZnBRcUNm?=
 =?utf-8?B?OElaMy82bzNWaks4ZlJ0eWZqbWhhbk9UZE9laG9pL0paTmF1SGFzeWh0elBF?=
 =?utf-8?B?WXJwY0l1aHBaWXlhUnY5QlJtVURkTjVhV2hpK0hOczdlcFkwT2xpc2ZScWNW?=
 =?utf-8?B?WjFwNXpZYjI4bnVEMDZxVDBDVGVxZFVxVk4zWENwTjJOZkc5VWVidW5lOEVw?=
 =?utf-8?B?dWF4bHpQR0sxNXRxcmZnUUF3dFd6b0tUd1pKVU53dSs2em5yWVpvOWpUSFVn?=
 =?utf-8?Q?yKYuU+xKr4SqSehrcY5d3s0ojPmIQ7xvq7fgt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd6013c-2beb-4d3c-732d-08df3f04b238
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:11.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDMf5BfSbt6NY3SZO+bN7XfPGVmGpx74a9jHATSdMzbYx1DrVeMlg2y7vTWZJB4tKWgHMt67o9RGVgmm2SlJml3L1RdwMBuLGCpMUe3bGLkRWFmZPUeh3O7JnzuzARJp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

regmap_get_i2c_bus() applies adapter quirks on top of the raw I/O limits
advertised by the selected bus, but it starts from zero-initialised local
variables and then overwrites both max_raw_read and max_raw_write of the
copied bus. If only one direction is clamped by the adapter, the limit of
the other direction is dropped.

For example, regmap_i2c_smbus_i2c_block sets a 31-byte limit for both
directions. An adapter that only reports max_read_len causes the copied
bus to advertise 31 bytes for reads and no limit for writes, even though
I2C_SMBUS_BLOCK_MAX - 1 still applies.

Seed the locals from the selected bus and only replace a limit when the
adapter quirk is more restrictive. Also only allocate the bus copy when
one of the limits actually changes.

Fixes: ea030ca68819 ("regmap-i2c: Set regmap max raw r/w from quirks")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 51a04961faf7..8663a4ec0a3d 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -353,7 +353,7 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	const struct i2c_adapter_quirks *quirks;
 	const struct regmap_bus *bus = NULL;
 	struct regmap_bus *ret_bus;
-	u16 max_read = 0, max_write = 0;
+	u16 max_read, max_write;
 
 	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		bus = &regmap_i2c;
@@ -391,18 +391,22 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	if (!bus)
 		return ERR_PTR(-ENOTSUPP);
 
+	max_read = bus->max_raw_read;
+	max_write = bus->max_raw_write;
+
 	quirks = i2c->adapter->quirks;
 	if (quirks) {
 		if (quirks->max_read_len &&
-		    (bus->max_raw_read == 0 || bus->max_raw_read > quirks->max_read_len))
+		    (max_read == 0 || max_read > quirks->max_read_len))
 			max_read = quirks->max_read_len;
 
 		if (quirks->max_write_len &&
-		    (bus->max_raw_write == 0 || bus->max_raw_write > quirks->max_write_len))
+		    (max_write == 0 || max_write > quirks->max_write_len))
 			max_write = quirks->max_write_len -
 				(config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
 
-		if (max_read || max_write) {
+		if (max_read != bus->max_raw_read ||
+		    max_write != bus->max_raw_write) {
 			ret_bus = kmemdup(bus, sizeof(*bus), GFP_KERNEL);
 			if (!ret_bus)
 				return ERR_PTR(-ENOMEM);

-- 
2.51.0

