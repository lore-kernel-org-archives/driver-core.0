Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88C306498
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929622; cv=fail; b=bGVd9bdNOYn9eOukto+N6EUw6g4yEB70VnOamKPwM2PrnUDL5mCP0x2dNfXkI7WfwI9JPWA3JCWFl+4UurDusTT7vyJ5A4BSZrUfiLk6ZGdkn//ZgjWuOR8SJXER1dG8cyc74y4cB7r3x+Y/GrHJDuM7rkr9LN7i3NmDZ+cyLLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929622; c=relaxed/simple;
	bh=wlBshwoJ0mCd6+aWFnAnUGkMpEAACzt9BO6trrsyQp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=snoBDpFPcA0MI7AUFPS1pNFYM0Q/CpWETxjkGJymF0XPY2LXqkZeFl1UAbtNbXXwvVvfRRct0DnSGH6X2FrY/oxRb0gHCwEWEJVZkjUrCkjGfLQE7lCPEVfERVVyDg9oM214X22cfuKI+2LuCIPI7YMMDFFj/TFgB2C3M/Kxoyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=swryI5zN; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="swryI5zN"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JCTCFr484098;
	Thu, 19 Mar 2026 07:13:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2048-2025-q2; bh=XJhFRGiobvWA+AUuIvQwN5fo7Hm//X+vWuZi3DRhzfA=; b=
	swryI5zNJKHfJn+PtX1qiMOniMEM+e5M8rvb72RS6w/OzJ1+rioKTen8zFwsy3KF
	5w2HJ75f4aCpqqHV9pQsvrO7kIl5uPbhEi7CoZUtLfM8bcEyfROslvo9Zx6giTIx
	4Xz5UH8SjrbInLljY9LgXZy1aMG3e/uROwQzGV1I7GXxcyJxBvR1zb7LNAAxvkjI
	kQWSiog2V6EFXfjyW6xTJrgJzttauby029cBRxZwhnjNs89XqNoJBO2nmGpDpuIL
	OrgLL54lhahmPxIraelKkctZEwMwG/BIGIuIVWDBrPlW3wY0wv8JEaJdiUYnQ2A5
	1o4bIHxFJVz6SgLVPbj2GA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d0h6fsfhx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 07:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB6p24RBwxGgTd9lcDSfhl3uEQcQRnh2X7NAxlHMVRAtNJM7PCu4wgQmz8rdKtDZ36DH6rwCpOQyRaq4R/B4yXJ5633Ff7NfridvnTLMShuZfjbNaebrZGkGeNsHju4UMqqiumkJ2Jzm9XT0JA3MAuJA9JnOBr7ySETGo8kxdKMOF7T3kCb7TTjnYJRK1YN4lCgpcvbZ2xBmsphG8dwJ29gEMZGbwrlrWbkcyO54qsctaSs7bLWZmjR1fuKF4Keww3skUlBZ0kNr4k2TCN7kNzLVxsL5fNlrhsU0xFkeqFOeGqk02pk6wCPXLnkwsL1SyNmp5RLeIqt27Mf2Q1DW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJhFRGiobvWA+AUuIvQwN5fo7Hm//X+vWuZi3DRhzfA=;
 b=hQuK7J+LId5kW760tBNK9nyRN+NzGFy8Tm3dnrecfYiqya3WIAQk9/Av9kibCwfV6Ftpu5WWpz+R3U0+kE0zEauPIAPw1HWlmbm5wLrhYOyh776isOyXockEqwHQSLzp0/eDlfRsLjoWx9AhMsJ5qodpCPG49PuaLIm18XawM9Jnu1HI7ru7Q00mtQaJYHAFsl+m5HzlQWwkQLcd8p1oY6UcK7WrVfFuIcfbSSnDeZqpiQ7V+DH1r9oDPhZ7XZrRzs7QcCafvcBDxepxh/XVVCTkIOQEwRAZSSb3/nkJuvuzEgDds2dx9fX+d9vjdopSGx6EctjG3VxMI7NNymIvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB7015.namprd15.prod.outlook.com (2603:10b6:806:4bf::16)
 by DS7PR15MB5374.namprd15.prod.outlook.com (2603:10b6:8:75::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Thu, 19 Mar 2026 14:13:09 +0000
Received: from SA1PR15MB7015.namprd15.prod.outlook.com
 ([fe80::3160:a98d:175f:3e21]) by SA1PR15MB7015.namprd15.prod.outlook.com
 ([fe80::3160:a98d:175f:3e21%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 14:13:09 +0000
From: Michal Grzedzicki <mge@meta.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Luis Chamberlain
	<mcgrof@kernel.org>,
        Russ Weight <russ.weight@linux.dev>,
        Danilo Krummrich
	<dakr@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] firmware_loader: allow firmware_class.path to take
 multiple paths
Thread-Topic: [PATCH v3] firmware_loader: allow firmware_class.path to take
 multiple paths
Thread-Index: AQHctxEDX/vfYqOByk+UGVLuRDMXD7W1Y76AgABW5gCAAAF0AIAAAhyAgAAoowA=
Date: Thu, 19 Mar 2026 14:13:09 +0000
Message-ID: <A24983CC-F76E-43A4-8428-D4F323B2486E@meta.com>
References: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
 <2026031940-baritone-handsaw-f1d3@gregkh>
 <28b06032286beed696b0e95f9e96247cfd3ff667.camel@kernel.org>
 <2026031906-unspoiled-bunny-2279@gregkh>
 <efbcc06d09d6232b8dcd6793b5f12dcb85e9f1ee.camel@kernel.org>
In-Reply-To: <efbcc06d09d6232b8dcd6793b5f12dcb85e9f1ee.camel@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB7015:EE_|DS7PR15MB5374:EE_
x-ms-office365-filtering-correlation-id: 05783e97-bb95-48f9-94cc-08de85c1a650
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Gg/yWOx2yDH/8sAfj7TWX+R0+V2zglaImdEsNK1C+zG+7qWz4MTj/jwrsYebDUXv3MvMyKpjsEpv76ozCXXGdeZXwIBY47VZytQODRjQEkWva9Uly4ZMnnc3BfqNEZuN9x5FeIY/xHkVWRbAbNA0tH81FhHgJ0X0Z0tYNgXCxuGNKaKQ62a81t+L8No5bMTDtfUC6dOqU4i8p221aV2gWE3HcRun8UyvhB1p7PAlkafP7Dc9MCkLAwgzBwvfsFPAlyrhvvoQGNq2k+vJReoFqH2skUi8EbWl1uACeM4y5DsXRAceYhhgY6mYgk7U+Evg4W8rFkuc5z9ldekuAxfGeL//UCjPiHb/EyrIaA1jOtGMIRv6g48CW7LK2rQ6t3wSTlIR4n3fdD96bU4Fv0kY6r0r7l/VEVjFwvY/83cfYZ8KT80RDy1RjuJHnDxBfpY/Gmq4qJw2DChs4EU75P1ir5zD1Ffv5JBtm0VwXmGsXeANh3iUAIJz/S86c+8qcpP1bSsKiy+7LUv9+L+7MbUtfiIwNvx/Ogu4kmDTr1gPedeUthZgWDaLY7x01jeWamCvHwQQt2xiHcMm0bD5jTtltO1DErYDRLMwxMwvpcSGisGbQaGxev/64FaCCP7YNTqt2erOH3L0nLQFvqdjixSc0UqZzaMKt3BgVkhN78RKz8zQORU15tdUxWMW9YmgnI8pU7WKW/H0LVUzZLfUuMomClOlUhW5k3zd/kZ1Qtb1uloLoWeVif9G1ZSGLprD1bUQW3TTrV8hHrZGAwiimzNPYI9KXeDyU35qduY6/p10sY4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR15MB7015.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?okWSzWBv/CXisEsBBzpoKezq4wcj0kXMdkIN71IJloWDhn5ZoL0W6EmOcLop?=
 =?us-ascii?Q?kseT2jkzq4Oq6zjjiOJo+XVuk2Orqhh/YRjj2fPoHE6hcRYjEdd1l7EP8oOe?=
 =?us-ascii?Q?m30a/9S8KYkL85K/bCA+nFXFTeW4JQC1fiYChkv8G/sOnr1ElB2MCfVqyBCx?=
 =?us-ascii?Q?ehaPEhiF77ISp2ylkmiS2eJrIpq6uIKakv0slJA2tnBvisV6bEm9kvNBHTiN?=
 =?us-ascii?Q?YRxuAA45pSHpWQIQSVy0zmqKP/Jq2nF19moVKJSl6K13k8FY+Y8fwR/P13+2?=
 =?us-ascii?Q?JI2r60SivniHjo/xDHYo2yzmil+tAVUqwkDmUIeS3ANKJ5UKxNklAb0PpkqI?=
 =?us-ascii?Q?HgU8DxrTVaMpMzDwMjaNb3mr0WVFY8yoIHrArWcoFq/sxYDXUxKW+GgCvEt5?=
 =?us-ascii?Q?XVSrQd2o9RQ7cMteeFyzXuEZDeEXcUiIeCJRtooBHPihRUCZRLO4kGsZwjHV?=
 =?us-ascii?Q?xd1B/RXJ5Jf6gNU9RsyPKmDk7pkC6n2qf+lM5UWlzHlrW+CfahKfM8xqs40d?=
 =?us-ascii?Q?VKGR9asgipzmx/Hp2swXqDZkGH401KI1zgLA7WAF0onqIOemAGL0HAD+j+BG?=
 =?us-ascii?Q?6LTiuVW1A9BbKtF5Dnm8W1EEGkS9Kj/Wu6AphTmKG3B5jKwN3qvQ6Y3QQ6Cv?=
 =?us-ascii?Q?UQy7YScM1kIPyHd6qX70ma3eWXv8HyM6bTrADBBuJyu+2/BuZ2kwF08XiaF5?=
 =?us-ascii?Q?BV3wQ+isfderFRTLQAnpL7u5QBbBLtACb29ofCtBf8N7wnBOsO/5KqboOKvU?=
 =?us-ascii?Q?6kwmSfI3jVRXEDJudC6EdpNHxXB/G9lGIvAk0ZY04iWeCJk5CAD0SIW/sjxe?=
 =?us-ascii?Q?Jf/bKd60HYBvnqCVRWmiUOxLY52rYnNmC5Mzl0+RVwQo20JPv7ot3cFhIvR3?=
 =?us-ascii?Q?96WIbulNiaI+WOpgu6BZtE8l7ZmbCiQF5MrmAM6qb/6ilWvrES8qtvtwzGRm?=
 =?us-ascii?Q?6M+xshdEWkMd0Z0sr4dSc4EEo2qHQpQ6BBRgMw6kJEHiLPfx9HBTwOUUOTzw?=
 =?us-ascii?Q?Nqx9ocUQbZWqRkOYxHx8H9L1TJum5LZQsxSUyBkhnFKyddfH4MoMmkFnGWRm?=
 =?us-ascii?Q?pGLUY941bfPS3VpZAOqbSAtUC7RtMhgErRWBD7EZhW8XNX96dmh2JOhsMeau?=
 =?us-ascii?Q?tqJxpTDMn4HnzQrZZS5n/K4BTMBoho9jswTf5EUNnvmw7/oegRdPhmnFuUCR?=
 =?us-ascii?Q?4SO/+I4vlvNdOzcmnJgKiFc7O2CTKOznYcboMFK1DD40DgvwqglxVMAKW2WC?=
 =?us-ascii?Q?7SwvbMgw+DKsLSQbd0t+deNNFabi3QAeXh62hJSCZjlrRZzjXvoWlKY0eWmJ?=
 =?us-ascii?Q?nE8A8/3mx4EsHWAmt7tmfUx4l3+tfuR1jabCCpMPSaKjsdlB2jIswc81U3d/?=
 =?us-ascii?Q?4lyLwDfl/+CeAvqBVh1+p6GGOmK7VxsL3KNmTlGJfTNj3AZuy2ceQAEy66dh?=
 =?us-ascii?Q?X24LzIgSzqnwS3SmiTgOqogWW+xycEkwN5J9w3dCf2wMrX+maMgOXjgiKzVf?=
 =?us-ascii?Q?YRd+8GzGhvCu2KYxRpH6qPI5ZxZO0cdaVKdfMmfQ+wv0wDavJS6CXwjJRWHg?=
 =?us-ascii?Q?zhlLoN2Hyk+1KA8jDwP1toULtYLy62vhbCJGqVgMcr7YnEF8p1G8aNSa5wjN?=
 =?us-ascii?Q?aFV/t1vwbYk8g1Pug3EoQPBK2sxigKmn1/IC++teiodQBWGhU46UqVctzXSm?=
 =?us-ascii?Q?lSNP+hLFYW1X43HTV4yKEcxnaAtJBfxAeqjjDZGpsJKGIRMA+6zbZTpEOxxN?=
 =?us-ascii?Q?HCs1Pqs79h0MhO6BoaUZjq+Za0SBkvI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F37841C39E8C142A4933C9BBECB9008@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	s8Olgr5H8YZOjvioMq8WUN6kQEkV9vYSrhlraaf0HpEn6octCCVIrOmufkTkw72l6nbKArR6tlc7VfRjKcSkypNzWnmZF0Qy8Uk/kBoSi8FVEGlQ+hRyKYNufKSZiwTabsNrcnCUXTaWiBkcQ3a4uD6FhY12gKtBvswenscEfJXL1AJhMWCoGdGTU/aJrSfa2MAy3YCdpBFIU+JVnJ4wIvLT68+ORMkYd6ze9esQRoUMldeTsrvtowPyQ4gM3gPW/M/wKbQSl1sIfkstFhDkiOEo/WCMBcIF8Fyoc/pc7/fZE+j/kUJIiOQeK5qCtvhNCnPjJw3zOc6orHqscBOyUg==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB7015.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05783e97-bb95-48f9-94cc-08de85c1a650
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 14:13:09.8586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gvXnDsExDldeoLnAzneDKtNrPKhHLI+0i/+fcb1gUydo6dZrt6EgCQJ+SZMkcnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR15MB5374
X-Proofpoint-ORIG-GUID: xRvHsiizIOQUZ9uWCeqgpPs5ieDUCgGW
X-Proofpoint-GUID: xRvHsiizIOQUZ9uWCeqgpPs5ieDUCgGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExMiBTYWx0ZWRfX//w9eXFEOm+e
 j/TzsbKf8bEgsOACuKNpAvxKYFfVqv3zXFDb12d6i0SDqk3nsCDTrRvAmBKifY7YnTnDxnwAGne
 0kxcOqiRXiInIma1U/ZYDmte0ZVsgz8y5SXuEm/4xQwkOum46uTsrtAuuXStejmADDvG0I5kChw
 imypEN0iNtRLolRgPTU9xqRw3/TGghCPYwn3odgiRjGm5crsFLg2edY4GHfwPxI5AvDbDO1ON7N
 OLrTbddxANYme4ZdCZPAK1LLmlh4mjZMc4y01Tk8rzoU0yk5hkGloLQuI42CDFsxKJ5njeSQNOK
 clXgKS21DcB3/6PWRFjZJ4NT6poQinScMPpu7+M1QOtn1EE33O/l+OHROGT2sA1u9nxypskH0QH
 mvE8IYZaPTmXjuOZ6FQJSrUg4Y5xRcdEDUldbFH94SbT1HcsXLCwHCRaSXaOld78ZGFJSken5dU
 X36yTgiOefX7+Ib9p/A==
X-Authority-Analysis: v=2.4 cv=b+S/I9Gx c=1 sm=1 tr=0 ts=69bc0478 cx=c_pps
 a=UZSaxNdd3h1KCbY4z3Yg0Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VwQbUJbxAAAA:8 a=AwJJbY2rnoiTFOdgqVIA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01


> On 19 Mar 2026, at 11:47, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Thu, 2026-03-19 at 12:39 +0100, Greg Kroah-Hartman wrote:
>> On Thu, Mar 19, 2026 at 07:34:46AM -0400, Jeff Layton wrote:
>>> On Thu, 2026-03-19 at 07:23 +0100, Greg Kroah-Hartman wrote:
>>>> On Wed, Mar 18, 2026 at 03:54:02PM -0400, Jeff Layton wrote:
>>>>> Refactor fw_get_filesystem_firmware() by extracting the per-path
>>>>> firmware loading logic into a new fw_try_firmware_path() helper.
>>>>>=20
>>>>> Use this helper to parse fw_path_para for ':'-separated paths,
>>>>> trying each one before falling through to the default firmware
>>>>> search paths. This allows users to specify multiple custom firmware
>>>>> directories via firmware_class.path, e.g.:
>>>>>=20
>>>>>  firmware_class.path=3D/custom/path1:/custom/path2
>>>>>=20
>>>>> A backslash can be used as an escape character, allowing a literal
>>>>> ':' ("\:") or literal '\' ("\\") to be embedded in a pathname.
>>>>=20
>>>> This is a mess, what could go wrong embedding another parser in the
>>>> kernel :)
>>>>=20
>>>> Let's step back, why is this needed at all?  The kernel already suppor=
ts
>>>> multiple standard locations for firmware paths, and one custom locatio=
n.
>>>> Why do we now need more than that?  What changed to require this and w=
ho
>>>> is going to use it (and support it, and actually test it?)
>>>>=20
>>>=20
>>> We have at least one internal user that requested the ability to do
>>> this. I'll see if they can articulate their use-case better.
>>=20
>> Please do.
>>=20
>=20
> Michal said he'll outline his use-case.


Internally, we distribute firmware binaries as read-only snapshots, and a s=
ystem may have more than one. Without this feature, we must maintain a syml=
ink farm to merge multiple snapshots into a single path. We would love to r=
emove this workaround and switch to just passing multiple paths.

Also a common pattern I seen in vendor shell scripts is temporarily setting=
 firmware_class.path to the current working directory, loading the module, =
and then restoring firmware_class.path to its previous value, with this fea=
ture it could be made safer.

Thanks,
Michal Grzedzicki

