Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710236E468;
	Mon, 25 May 2026 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779689557; cv=fail; b=GDhTOjJadDICEwLyNJRTUY3vfVEg+tx++c1beNeHnbucE0xDxxlthk09B5NKJKFamEzkgUcLgPVyVYHEq3mfz4FAM5O0MUMCUFcAqmNKP4hhJPqaR8FYXYBN5ED4ff7nbSg2fGRmVz7DZC/xCUIcumsd3sfWXxXPUszd3PIHLao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779689557; c=relaxed/simple;
	bh=ShKCoPIqh3bIFc1wwcwYU16rLj7GqrPyWLyfSRMEJNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=on2Fd0eJYbaC50MbQWLr8tW06FIx4W0BLnxib4eIlCk6jAqDRDFkAmxpCuS6Zzxxjpsv5hpTU+NNoJS8qdHTqUVxWcIxEhMosRdSN0qGD8vnUlAhEvmOlf6oKHQIdRXlHJGpli6Ze7zgnCbD0MweOgM2cmENdcMKJIy0OameuOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IR8JKEuh; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IR8JKEuh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nm3X7wz6ZIqIGHMDsZsHOEsaMWy1wVRgIVuCBhTzWShEe0K3peI+b0Qd1DDjzSkJtCtmmxqF6K59eHg5iCdlTm3utGTMR6gbdE7vAt3mCbpFSQDdspNwn0r2JpSJX+U6UTfAsKd3bCj4J0hpwQbF0s4PUgr97BhKWbeqmq/Zcpf69zmLM8sxbadZ/Ki3jLd72DcRKgMQLmMinyFg5NXkILtm9/DEE8N6tZYdjZ+zn0cqJLHTQtcpu3NRm9WMh49TJXGJb8/ar1D1co2lIyVDntNHp+XqU1uSuQ7J6BYi3dGlNA0cNooBGim5OFCcaFlq708YVuFUrrAOYASqaXPXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vYbQkPoqLGpvhlD+4VD3tNJHhEpcf2DCixZ2sufesw=;
 b=loTJNlGHOMuQBjWjGaKeelgsNHNWqO65hXrIOD69g6c02nhh1dIOWYSplRjNhC3mtO9x/IxT6qn69XgzhgYT7AuH+GlQ2KMjAHuFQFwUVPMODM25z4+0Jj5VKg4rKTvw8pClo55eb+VFhbw7y0ye2JZIUH/KNigyedwmQwmTkmfKkvIpIznXkb0XGxs4molX1wrf//a5VCw/J35yl/76Q2SJCbDqOOtEtIbVF21E7l7yxoz8KuNFQqpbx4f6pavYuNbEDpf1uezXgsEnGVlikhd8TAUZRmGxAziplssXtIzNwoswWn5/iPP5ksDqdbdu+wyIxnZvxXvwzA1JOvhcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vYbQkPoqLGpvhlD+4VD3tNJHhEpcf2DCixZ2sufesw=;
 b=IR8JKEuh25wW8Op2Av2Jhmb9l6dVk9v6k/by8kFM2d/VvVVptO/BK+vuSgPTX6WHQhODD4xArF5htHz7xhPR8QcstccMEQKD7Ma0vovXcDcET8fQw92rJsYlTeIVqyy92jvVbLk+L7JlAemXF9ssDNOO6LVhQ1s5dZH19I6JByrG7T/xavJ2TT0Q6kxlydiiZp5zsV2AzAVS3a8okoLwFXDA/NQMVjdSjbKPYB6dxdFzxG2WMhVGuaXiBSdLecfauOcNjJNipxXAO8x1hyJJekww4sjbGpecJnJZdXcblFQ4mdbpwtAPvb1n6zIVzo1k5DGzArl3nGI+2rct8YUY5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 06:12:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Mon, 25 May 2026
 06:12:33 +0000
Date: Mon, 25 May 2026 14:11:30 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	saravanak@google.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH] driver core: avoid repeatedly printing the same 'Fixed
 dependency' log
Message-ID: <kghxlavwmf7wdnftfeer6cadtwf5ubb6rz5n2zjvvsqwvachab@khyep7tsllbu>
References: <20260509111728.4123331-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509111728.4123331-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc311d1-6454-4047-716d-08deba249c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|18002099003|22082099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	dlcH7KdGqMhLwsqgN2kfeLlDRkqhR7AC8tjwkWdl/z4LXPdKeH/sfz9R41IXyyIG79iTxvYofrsjzVv0bSqWZVqSjfhUI+tgjfReZ7GDFN3IFNbWxmjRDyvFCuJZqB8s4xZRDqDjS+fAmcNi1Hgy+WyKegfp766n+6Q4lCxaF1NcJSwCt7xEisYdML3DrnsSkgOawwtrsHAFUuJGA5bE8fJRVtJ8aQHTcSMh+Bxq6VqNZB1Rn8D3EDl44OKvYi8yCN/vjnLaWeFAhZ195Un7Z6Hr9L8dOIiXKMoPpL9xZswg6mAo052+Nnvnr5QmDpoEtZPxyxPNXGt4KP2x1lqAs0gFKkm79WYks/h6WQbjwYwFl/+y2SItzZNftzH58zl/oUSk5MySnUVyK0dMqp51b0i7RQ3TB6B+vfnzxJYBDwvAJszjD6J+Gz+ZZxzB/oDogHUfknSusXFQz7cZG/hhCF6aZq7U+lxKlNgeKSvNNTZoWrSRFsf2MblotZ6BwyD5278wH7aINZm7kI0FWm7TgL3FK9m2BCosqd26icpLLF2LrTyCbTMXXsnmEqUzHfzFqLFSohixN6sDxjtMtQKMX511tUmX+/3ViH1IHUN2up6fKAiiosoSmdGX9e/uP97TLhn+l1Fx6zMe6ty4m7W5MylpZkau6Vl98BrjHaJLikGAknfK6YGGGDfnA9bfP7QtIRbki89aPtuDDm1jQ3j1QRvkME5KbWFAHiT+57qwATrp/wPXm7Iu/ghFPfAajU4C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vFMGPQdFwm0gZ5tCLFYwMrnzb3hhuPyIDRCgeFnCSZPA5INyUNV5J/NS3Pzf?=
 =?us-ascii?Q?VPG7Pjf1FyXyz2LOtQpbY1ou0IpYl03bcLnxJ5HQWnwq2TldVPizwetuuNe+?=
 =?us-ascii?Q?GlIFSkHUHMvvm8zyiRWOtT/ogPLnMeNEAKRvEMP8Uwx7UIgukCCfmio1YOLA?=
 =?us-ascii?Q?jdA7nq9vazAb0pvWfZfIdHsTHJtfceb4YYV+8xMqXn3wHw6xZGv5Z70lQAwP?=
 =?us-ascii?Q?4QZR5rqdnBmGXX0spaCfrbhsLicEnYn3YDcDyDczQY5qjXyE6Pa6ROe+LBa4?=
 =?us-ascii?Q?oA284XFC44AXiraQPP423dHgb5vB5Kn0iCeD0ySeGC6K6OF25QX0fPUKRMEm?=
 =?us-ascii?Q?I+wbbgZ6T0KcgJHStpky7PUlI8eUrCjPk+//KfnqgkaQwqCC1qabHW8fCEh5?=
 =?us-ascii?Q?4oLlRwaBPL/i5JVssqpdUaM4TRw5EHwFZGW+Bs3ux/RYUnVUHqTHQFjMeBMm?=
 =?us-ascii?Q?bnXfVMlB6eK1EIYJJO55i4XLMvme2RIydk+mrO+1jhk8s0G2w3tAsJd51GCZ?=
 =?us-ascii?Q?zU/EEErllhaZmtm+jqU5xMmviaMezSV9KjA+qth8FWhGJoM8xHPotHmIXZHT?=
 =?us-ascii?Q?CcqBzCQub0vDM8HFxvoJMDRY6+oHoOBrC4tyCJOK7iFBQmXh709YTfnYmyNf?=
 =?us-ascii?Q?22Ce/Ng6je/YBjGX2j0NdNVGp6b1gfY6Vx8GZyedzzqcwJpPlapWMpN5gJZN?=
 =?us-ascii?Q?J8EB4/nW3S1tV6Pka3M8xV+CjHvZrdfgIENQpR02qrhfqNZ2MU/3CQy3JAOT?=
 =?us-ascii?Q?UuyllIgfsKHhL0K1EznEL7z5dv2pq8ifKEUzTJ8fT6hdY8XQ+GWZ39/WT7X5?=
 =?us-ascii?Q?tGTnntnnqoiHiEkplapvmDFwMVpMirPUsO1hWs7cobJSbK4P4HrqUPzROF1F?=
 =?us-ascii?Q?Uf3zwVy5C728f46CgA6hTwPnk0U0MajY68FJyvCcX+iroiMLBkvTjUBAHMDQ?=
 =?us-ascii?Q?y9IgUBPoQHepD+8dCKf7UscsDtW2d4C41xIxmE5hnXpbWn8gmR4gVmdVixL+?=
 =?us-ascii?Q?PSCr8hMHAm6gOOahA2S4is8/Z6vI+D8LFaFxC2iiOwZ8iLkDXwCZ4zlB2H3T?=
 =?us-ascii?Q?vadeOHXlP/vkKE3xF/u1CKCC3KBATB97thkLA62LeCjMNUlWNHbB7l5A4AuC?=
 =?us-ascii?Q?/NJme2QB3XhoxSJzJgi0k9XbwvAP2IJBxf1kp36sGLTqMCNeR/Kg50//Owmu?=
 =?us-ascii?Q?rYWWr+lP6yRoI+VTwSgthAHKCcGiw9aovwE9it5eMy670pzXISzSm8wZ8792?=
 =?us-ascii?Q?lkML+32F/LrMsaS5oVetmzYauavL3wVkVerjsC+XOMQTTKGvTXpefJw+rvF1?=
 =?us-ascii?Q?pvtZ3CTS2gV0N9HAXRig1StbxwAKmYhsVI7JBykp0OdrKxoCcHzRe+lMNQFv?=
 =?us-ascii?Q?JCEHItQ0dZk/4AAK6WfvL4EMUXJJd4q0edcoXm0fhKIpfkDEAlBt9cy0SeKu?=
 =?us-ascii?Q?/Nw4h1/1kwb+3+blhGMRoTeVpId2D7raXQPcEHa2o5IhFMF+Mp6N8geZk+6+?=
 =?us-ascii?Q?07D3JwO0zri+UkUmmXmqjkZ1+YVMXnkq2WLNEkt86miDiB4i6KhS6kXn+eGL?=
 =?us-ascii?Q?FLooAcu+ZTmPP/G0dAPz/Yxxgq/31ehw8O4PsziUEuls6RLmrLa9uQmWbS/s?=
 =?us-ascii?Q?IGHpKtWVFsfXjkI7pM8RjlPnU4UH5Tk7STLBjtmhUeIN39rdmJ77Oxffi4yh?=
 =?us-ascii?Q?s9iw0ZMQ3xHl3f9au8AmSmSMPmeGLacGSwQakECeKmJNdemeNqAeEhLdPoJi?=
 =?us-ascii?Q?VIZB0N7I0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc311d1-6454-4047-716d-08deba249c0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 06:12:33.4073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fZTOlATsva09kRJOknId4cNuoSqNgCNGYnRbA1F250pdiAs7blDBbBSAIYUdIUFTvcUiDDZx544YGHhlJ4D3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

Hi Saravana,

On Sat, May 09, 2026 at 07:17:28PM +0800, Xu Yang wrote:
> The "Fixed dependency cycle(s) with ..." log is printed for each cycle
> finding process. In particular, the same cycle may be parsed many times
> during the proxy link setup. For example, if /soc/bus@4c000000/usb@4c100000
> is a devicetree structure and node usb@4c100000 is in a cycle, then for
> each device registration (soc, 4c000000.bus and 4c100000.usb),
> fw_devlink_create_devlink() will find the same cycle and print a log.
> The repeat logs are redundant and may cause confusion for the user. Move
> the pr_debug() to __fwnode_link_cycle() and avoid printing the log if it
> has already been printed.

Could the logging be improved here?

Thanks,
Xu Yang

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/base/core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d49420e066de..af0371d4ed83 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -127,7 +127,13 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
>  {
>  	pr_debug("%pfwf: cycle: depends on %pfwf\n",
>  		 link->consumer, link->supplier);
> +
> +	if (link->flags & FWLINK_FLAG_CYCLE)
> +		return;
> +
>  	link->flags |= FWLINK_FLAG_CYCLE;
> +	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> +		link->consumer, link->supplier);
>  }
>  
>  /**
> @@ -2140,8 +2146,6 @@ static int fw_devlink_create_devlink(struct device *con,
>  	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
>  		__fwnode_link_cycle(link);
>  		pr_debug("----- cycle: end -----\n");
> -		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> -			link->consumer, sup_handle);
>  	}
>  	device_links_write_unlock();
>  
> -- 
> 2.34.1
> 
