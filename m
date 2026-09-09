Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E13397931
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954328; cv=none; b=j+0KuYDl1g74ri2mhaHy6qC65GZOatPlSYiPOMiW/GtgtC2Y1pTLUzR4q5q8VI0ean7DfCQB8jwpKWlFQLD86MPyAQTBD+fLu6+sXYUDhRqHGjTBnKAcovoUt5wPhaX8TuXi1chExmzhsXlJMUVaIN/ua7ZN+qKG1LhYEWA0fYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954328; c=relaxed/simple;
	bh=w8t0PcgJAx9ctFVVcRI8rM3BIltwafJlxl9b/hayqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPkSk/rJ0+1WVft1VkdIbshnWGFYzG50Tv3WRD5E7TYqeQRY8zw/oEYYsT/YhwbFmyNOEY/UwJOjZe4SHiYb3FAHiD0lohpX7gtlWsNfoflML2UK6BiEm+oLGvGfRNhsmaT0XTcpjCJB7tzwpfVZqDufo5QnQyZx0vHEPY5Z4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVctFaCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhwgWlxk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVctFaCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhwgWlxk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BURBD1145139
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZd03ZLm04N2hieg4Jz7IpXL
	9lB9dSQLJ9uFkAaXkhQ=; b=WVctFaCMOilWNlc2G3VjyRltEj9cnMnJrXHG4PRE
	3iBbZuR2pwOkRuoowtaf+axjvSB1gbBmVr3VJh4xugJ45VFFezVSEZ1NfqxdxpT9
	1hYut6M97u5llEel2Xtp3bfqf60yRduELQqSPf2/S8mNi7NCLJPQuhwPW7JbliFB
	8SvmZjpWb24yxcJgOH2GZgj/LajfuywIoc5M2XhyO1szDqeqT03H8MRNrPDgEcay
	SFeg5kxiQOyGstsWMB9caO5BA8a4NT96/HGJlgzMcPIN8thesYIf/H+tlQgc6L4n
	wVy4I2iHyXFCpdERKUB2USqbyxczhJCiD+22WHLjpBHv1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp420d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 11:45:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so157280785a.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954325; x=1789559125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=DhwgWlxk83VaOTRwcJKS+2kuNerReOU3Oe71HLBoIifI6Bv/zOguvcGfiJZRg2ZtZ9
         9BYMxc6Hppm/G3KLWp1IpWhRPZTCz5tu7qItzbOTn+MF3MqmiNt7kagcDEapCFU7Z5Tv
         T0ULCxyTYrHiYd2B5Qj2J2cDI1TGbidkwVwHhVD3PbdRV5jY1sHznXITYad7wBZT2eUm
         xZKOiZoUOhwwi5zo5rAkMyFzEZyYp5e+RIN4F8mO9QXOb3qOo7zMK951H39JmExVSmip
         gEOXWwLkWqqzku49dM/p8f1mO/wdOEeiixhYu6Q4momuoogFaegdnfpT8pNrBpOp8FQ7
         4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954325; x=1789559125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=oqctMrrRGYy2YD+u2lFNzx2zNTq6stMN0hxdQLU3pYTFxcY7T4YdNJYAZ2sDVOTgRK
         yI91rSsb52mg/X/CxNtyWbWO90dGYZdUhETIgN9VGM+tbOmM6uKRcSH4R5B6Lvr/PwNG
         MybRqaunztKUnqrOf7o+O6oT83E0dQSJI3FK9Q2rf+yQKrws08Y5B8cPfQiC0LI/T93K
         0ufLC1mYa9frR7FHe5VMOZZMPQ9NaUOY5XKFs1bD7x1eEC5Lv89aDq9iQreskKdhRhZw
         ZiFjSkGIgRL59M4x8FodUtTS+34N8uaWDsRt7fXhu2pmu8I31PdNyAJb6vUzbBAgXMH2
         h4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwPxfV25PwyhorGcLfG3NKI6TBSWK3jmTAYU8HR3X/Yqq2NDes4cRtpVUMizPDc9wWg4UwSz3AMdmveIQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nh0XA/7QNaG7ZyU4sSDwqlqCsbjZimGNNK9X0Iu8gCoCp0FQRb
	YhEpamkAcBNT7xbuMpJSShtkkbbjegeCX5nQ+UF+FKKGlFXagu68fR0msDJpAjulADYi0ed6fV0
	YyoLGV1tzcw9uXfOe6eUW4nFpZ4GZGkjCuFctfZvxuNs/gn+plEgVr07o4Oa8X5MSaQ==
X-Gm-Gg: AYBFou18o1j35+Pbohtf0JFaXs5btazAWU2SWTYRd9Z8XSyPZvm8Pvs7G+SgQ7ATVxP
	AWgHozTbzFq7x19P7HlTBHxZ7op18AeGLUIY6cYM6aQeJYBzVtK/ZvfbtSd3VG1K7XXpBBYhAbX
	KtqRTIQJtfhYVNq8y+gTcwokk0SWb9tMBIfAmFZzdQazqxJm5yfaLDeeekK9Ay0TGslJz+FOXJ/
	YO3Y3RuuEi8/oa+yAA1OUM3VOHnWcm4DDTGZfN2E6aa11c4NyVKJAwCnY5CAJ6IMWRc8duGxuId
	ghMYlDLjV72KsIjOr6ejNh6reI4IIyAeXsOh5JnVqNj0BgxS+iJfoH24awEwwtlLxi9wWOVhE/n
	LakZ3LIhyeOA=
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721125585a.40.1788954324860;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721115185a.40.1788954324141;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm412127415e9.2.2026.09.09.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:45:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:45:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: qtdFkMLmVZ5OlJLTlQ3L3weq-JUjc8CT
X-Proofpoint-ORIG-GUID: qtdFkMLmVZ5OlJLTlQ3L3weq-JUjc8CT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5Ru+70mRPX1r
 rd8dpoRYr7k3P/6/Do5GpJAaQbf4KJh1h/KGBGN/Nv2hsHO/dP4cegBlQhC7BnX+zWlTG97DUrD
 03PHfaY35kfn1ubWPNINCGM12Qsb+adXPFUDmxQCuLfYT1aP/D+Ox1CgSgRcCUOgJJicffMHO6O
 4m/wqnm+nn/lKY7ALCtL0/ncLFvDGHARCrYK7PI9HInojbismtqx92A7memy9P/KW2a822CfJo9
 A7c/T/cRu1tzgvg+Z4BRHPUi6NcZm0VWYfXJl385wK/M+ZdaTG6545vcXxRinYhgBNiNjPygXBf
 5mKHSFjLCvI5xPOQG6Pb/0uKmUKBmkwna7Q57/wWCIVX8jeGFSaIVF+W46lMiHDAp2SAgOyQ/0P
 U60pPfXzRpRRPN53di7NVL7Shj4LYr/8wLiytyiom64DsjRy+JPYlqFy3MxVUeVMtlIaeEalMcT
 CjXjhAtVZelnQefGdUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6xwnN9CEfJwx
 x4CltEhL1JLWos//lb7qWX++uzF/qJj45WwjI6ty+uL1sePZCGH8BRa9SkGp37Z8lbht1xUAqrQ
 4mjmm8gKSmDD+j0/i7w61iaQ7zggSQU=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa146d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:20, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
