Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3893B5308
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848404; cv=none; b=F02eRbiAn+YibKj5IHySYILQA6SZBneOB76a2jMUS4DXDyCYzQSwxfcuHlvRBJGnZoPPwhjh3beKEVJsIwMoGlUzo37ac6KwiAlytgaYxJ+cHztAgJx1yEjy5OE2yl7f+AS1SPme1KTrmTmDfA92NBiuQLgfTQi9R7eHvJ43LfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848404; c=relaxed/simple;
	bh=fq8QMgxGO4I1bjwsFUxPjh0/fYBLSgr2n/oC9r9H/4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9Ay3wrKL6vvBs/qjoHB9f31XfPIuasAnO2ECJiUfjA8t1VnjCIHCLc6Ja2arTHc2+sqdlu9kc9lODc3yZGm2nw583HiDRSVopN5v6Q6mF/6k+m+EEL9nJWKw6mKaZI8n2OrOZAWcSzXnQMKj8XjeN9xzm5qzDzt7x/9dHx9pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Qc9Gzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ao5fUbr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Qc9Gzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ao5fUbr8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXkLH3963654
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=; b=g7Qc9Gzqv7FTuSVV
	sx5RAE1TLnpBzhaV8WNbGJTH+G426L1AjdZhaiBTjFyHjYTVj3iof5a8Rbn+UsPr
	1cLq69tAJB8S5os7xGHoAR26JGe6g7Fzg3fcoW2cF/ACthdf7BGy6O7QIoNp9dOh
	rwuzw58pQX2PI4Fs0j2za/no/mXbJPf04h9BPRgpIf560jhzeV8ontGzssoqEKP6
	ou6PRFqyJaqmyqNXVMP85bOrSxEvABpgSGlEBOstj4elQBd5yE3GO+M0aU4Em0df
	aOZUwoxIIs/bYcz4PvxyOxI5EzhhzsVBh8NnD5rRAcmslFWWcxpDoZ2eOhVO1Wdn
	wQ8vAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3vwd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509007aea22so325110331cf.0
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848397; x=1774453197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=ao5fUbr814l7w7zDg89TQ2+yhUX+OVjH+6mWbDmSMbxzNAahOIAug+V2w3BAvPjfvy
         ub439zjl8DmUabLqPj9ff1HwrbV7WXZSIoP7kcCGZlfiOKe5kJYnZzG7qxujVLSJxHQ4
         8rC0jKTV6WGYUmAStEUSHFybJo0e5Hlk+6wmp8bph06CZsbadkqU0rjnq81ZhpwXlp4P
         79kr2yHqYJAFeUBNaLs4GtRNBa27nbB5LfwUp9wEp43w8UGUzveerynhbrYkPXMp52Gq
         +wVoSchaOaLEHkaP5kbEWITeZAYicsfwgR791ZZnvOHD0sSlTVCXj/W6/VPZpEWj2KM3
         A/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848397; x=1774453197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=CdZ/hFji9/4dA5xBi/DE0Dixwkt6qgBTuC2OjSsAPqYHxdopD30/1UWsDbMnWqBXFk
         OtpgWXawNpZ8/9tAJL8onqePjzIpKnxKx8kNawV6i4BgAcxTHdz7UneT6sm7aGQqoXgT
         BWKg0qz59NtqrDF+8Pxam15Dsn3/bVA37BumxGXfOjPWS+kR2iw4mZcH8Bha29uFc8s+
         dafHwZVHqiaBqManWRpSy4bwBKG0WhW4X6kj1cygFrfmbm+7ReskgvY7swP14aHPsmTD
         LZfLWJ1hVOlQyfweCYi6U/iE7AcJGDzLf+rY1vcDm6yileWLdIHo/oxw0cW77KS41ItT
         DzMg==
X-Gm-Message-State: AOJu0YyLrWG1eBWuG7aaD3tZQMVGvpNQLidomYbhrmw9JVxWaXWa0ViR
	bgL9XCcnKkGP3RJHYNWF6/r41QzOliL62mSsOFZ2GwV/YVR3yfxtkXnPIMDohHJVGnbeCMlRbPf
	MeXqwgCCLPwT3EG4kk6Ni0dFrJq/oSZO2nX6aCViZH9l86eWXQ8A1o6oRS79MiOR2jQ==
X-Gm-Gg: ATEYQzwTMebayktx0P6Fa5IpCi8PF3a03CrCumowk3spgTntiMXS9Sq4LU49T96++gN
	1KQ0WmaA8Cjz78nTl/l3Y1jYodOdAJyYJpwAndhYL9h8rn3KmhT2GP9s0H7WfXsQRXaGDHn+lus
	mHUhf6P6/EmBtPWXwcnlvrrKjNJ2xZ//4z/yH7cUEJ4mymbEjrEQJiVhPfn7ZeVqJotPRrVaMLM
	ceGyMkBgF7qj/lPlE1BqdvawoILjpH4jEZFbFjoXw/HOi9FATFbBT0R3GdQIEE7n5TcdNSt5XqM
	c/1M/XJVERd6N5WZAWILZdfwF0aZlD+qga4FltdvZVJjIMENhSaRp5G8j53VuEIPvprfXakQbQ4
	X5hgTchpVyV+BFGO9SHkkCwdVhuo=
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167651cf.48.1773848396979;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167001cf.48.1773848396367;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 18 Mar 2026 17:39:32 +0200
Message-ID: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69bac74e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bTwR5g6i7njH7xachKcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kpyUugCOWFy_9dffYdCtUssR4bEpinmi
X-Proofpoint-ORIG-GUID: kpyUugCOWFy_9dffYdCtUssR4bEpinmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX7i+E9ejH1L2W
 XkWXmbB+YVKjstqq4dMwUhnrNJi1nNyocC8UfiNSdF7CRov1xweCWEfWBBzMj5HahD45nsOE/z2
 oFvI1dmAgkW9YMBRofk3Rhs6/Ft8z7qsQaojGRFGFueVZzLq1Cp08vr4aVNZX7QcbXmPN4AQl8f
 oxjmmSazVZAjNgAf2UyEfWXv9FJQwM0PniwxaBmPP0n8m7xb+kAvtfjCcDP7sDTcajZO3gJSI/6
 Lcr0CkNYR7F2sXUDV+0VAoXHF0GZ/Ot3zxBz1mua+450qqG2rXisbgKqBRxxNVZgWLgskohJwRT
 iNzadN+lB6w+SVKtjNrRBa00pffCe3p+qX4gOMpfyUDPvgoWtBMRWCJdJsKQ/mwOhWmOrrWfGTD
 cTNWUyskDK5LBWpJJ4b2U5XOsNDYp+oTevxWV646ffv8bCG4uC8z6DfHr9o6F/o8mtE+so54jFJ
 Ev8xyeo4xgmDyqF2qDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132


On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] clk: scu/imx8qxp: do not register driver in probe()
      commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
