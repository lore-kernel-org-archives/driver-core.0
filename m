Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAC50391C
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988464; cv=none; b=YweMtaJ3s+WhWYetyLQYLqI5o0FaifSEyhjF/L3f6scgXBQx5/9q1kAt2xxxHJXA8NF2abkfgefkNgBMrByQ1r1amhEB2VD03CWOenilGqxsZGGnnaaW8db75ZLoDuHFHjc90ApdtuZVyCCM2ZlbBdljiRtOMAn9S/4XiZ4yGK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988464; c=relaxed/simple;
	bh=AhzWaDvUIwAHQ+BlQRnKWnDdRRuOjnRQTjl4pNt2kSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk6tV/yfGZaOocfcB2ODoWOhFCHQ/Cil2yaLyW0sK6wJxqLnB/VBdwn27jWTm9wuHGy7AxACpTO3O7qHHmuTxY9xS1uSVHQ1nVANbWRYcxnLnjK6cPePOZ2MC7VSRZIrl0zmpdo+hw5VHXHsTqnFLUz03LVYGhgUkXXariY0Kjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM22UACt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkHs4zcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM22UACt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkHs4zcw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eE663696456
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkVhPqBAgtTYGz/vDCDa9cYD
	J9dul80zJVTym9S6bp0=; b=dM22UACtsytu8da0dYk/ABEptDNJRsY6iclP1dD/
	vPYr02ts2qr8AcnqvUA6HoDcrjKdZ0ZkDEXd2kXf1U79emwtqXCTH5m7bIj4x42Z
	gF6deDRHExI1jMAfWwMW0vVRzs1e5hLPWPJjMaC1dF17BUtfgBUZnMWP43FmsXah
	AUHCHp3yX/YHMkJMN+G3hLIUj6uC5wKHy3dZ8vcBS9wNyfrl/672a/eRc/NXnog7
	S5Rod+/JLt0ULJxCW8/lnS1eEzSTWpK5XTjFwETz0AFNBF8shmQ5ngUyKRL8A8en
	sMAncAbPlhYbEdSt3JEnBb5pF/PvK8Mar6oFE9ene6XTKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh4rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:34:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso781268185a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988461; x=1792593261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkVhPqBAgtTYGz/vDCDa9cYDJ9dul80zJVTym9S6bp0=;
        b=GkHs4zcwRxBOrioEMIdmD+psrThL5wMgjC1IgPUeDiAKesfxs5ZaNSbZn0DiafN73K
         evmbO5QdLbP5+ou0a+d511v05uHjzgXDZOyMf/ftlQAPQiGJ1LpcgeP2tRas/gIPtXog
         99CQb5hk+bOm3RiztNBvdFCmauVEz6EP1uKqAnztXkGyB8aEHO+5oX5NPhsFDFiIFMEA
         V8pUSGtfkCv8GK/H18otSZrGusDA4oCr0bwPvltYzNRZdGQV3RJQKAvo2MIDq9UX/aQv
         8g4ltce69vZpnzQq4D8fAtkuUv9qupu1F+D+ZXjwhC20xeiGOEHX5Xgqr7RpbOeFqZs0
         V/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988461; x=1792593261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkVhPqBAgtTYGz/vDCDa9cYDJ9dul80zJVTym9S6bp0=;
        b=fZLxyYkE5VYAtcWCAb7NiE9t+QESm2Q2gqm5wdV4saPB+j9bqrdADX58m9Fs1GhY7S
         zTUCgvsszhkZf5xWT187ayOgMiyr6yejDd6wRWBPzfKBHKeZIXYYyAsYqO123taLmIL/
         71HAszcBVhghrX/57NFHRnyvwhERvp4mxaTVYrCJXZdmHqrg9tOCxo+JxWjfC7+s9S3c
         e1CSZ/N8zZw/sLNrqppmsYcaYcaLI6CLA/RSmZCo1/bbmlLC+oEH+BnU3zehLRH7GVWA
         BFzMoKWjlSlMXxz/cOT2xJJzx7THvViQ+C0lWf89Vm9oxEZEKC+HXfmqKvsfJquB8Yws
         T6EA==
X-Forwarded-Encrypted: i=1; AKwUvBxrnrRvhpN7HybtPQuWW6ob7XlwwlfbRzkCH3KK6jdXjswPtDb9ZEgTcb4OfTrRsrQLpd29H3g9njBgVQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK4IOSwkbpgS5zlWuF+uQM+BYr5ckdc8r1DUAd0rYnv3j4IMsij
	dWB16bYprTyEj/Vz5B52NSaBWE1bwmX9sr2TCdDNXTEIkRCVV8UosthdEmTIFxRHqtfLG2Hl91n
	yyFBfq1M9pISFQEDIrjXXWYRBSyDyqJ5Fv0cHwRwzX+wlYoSKL7ZYY+Del+0dxPd1mw==
X-Gm-Gg: AYBFou0rKbxm/qkANrifCPjo8JowAm+2g1pabLu4X4dYnHOI/X/2EdmunMjqBSVJRxB
	FiJ9eCy0l8V+ghneOj7a+jIrUPupKJzht4mddvMK9j2LW5CGxt4YwAsZks98U5EbX60ghoAEG1s
	LQ/cywtV3KoYQQBZK8zBOkVkRh9IyI+lnEGH+9fq1Bg/HU+/CLoIz05mg2iGxyU5y8iyQ7HIDgC
	LWdVHBkxg3ClpZcJu0ijbg5xqD2JRZz9vOj2RroFUkE6vvXuB+agwL/FmuOeZG6sI+02OLhUVD9
	msvRiVLmTcq0A8V99ImPdPCVcG7yKWKjPcRy9eoj2Czh12n1epG2jGWk9rsMFh3WqbtYx+a+JBL
	TgbFmhBDVPiowrJIYD1PTm5mdf22iTKzBJizY0S6XjohE9PmX+JtMOehMBKm9/Tb1TJhIBx6z97
	ZyyRZ2J54hhCOW
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2667920585a.23.1791988461107;
        Wed, 14 Oct 2026 07:34:21 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2667915185a.23.1791988460587;
        Wed, 14 Oct 2026 07:34:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d88252sm712070e87.52.2026.10.14.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:34:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:34:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Message-ID: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U9v_wb-mZ9DtebmoxIqK_RWME_Q8kObp
X-Proofpoint-GUID: U9v_wb-mZ9DtebmoxIqK_RWME_Q8kObp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX/m/pqpVbhE40
 I02kX6Qeo4wnc1Rqk3aVpXOOvxXN8Trg4LgZHIhg2ZSkicZl33LVYIHeuVpNBKS6eNZd1jmbNsD
 dVrV1SSJuBpcd6+9XbYSo0bSIJ540XE=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf92ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pb3S4GdlrFqZhq7q5XgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX1Yr3kUuJJSnT
 jDfAZqb08S3pTWLIGFU04BB51ypCX8EWY6QKudI5m8hpwi2xnGgUCkasAu9JS9n9GaTK874o2h7
 Jz0p4Yvn6//E3+QOxJ5QflQ29ns6336Sy0/TQA7WhCvHaCljfdakn1A3bBy+qFw+1RGc5EvdNcW
 bMkTnjzvdP620L0gTXay1A9yUnwYTkNCUCGhsUvPOTqve2TdVZIQEHGbQRmmpq3NVhnoqQjSJGB
 NyrEoLT8hHht/LKYst3SsFhi1YNlX4Tn4oU/ZBe7EjBOTEF61BMLgFFv7509SWgbtlvzeNf6pNz
 cVf0RLVwI1m4vd57iOa381R6g0Obp8UaUu7YrjE7vJSn/loMPdsd9XkZHlbQHuziNbhrd+2FT6W
 GBPenzXSoUJgVKvkZx9GNigQQAmUtUS3A+PZPUrHH0kwawrlBdSbn69aoZyVHRvqNeYtG/lww5i
 66TV19Swv5tnKJvYXwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Clock controller power-domain attachments currently become parents of all
> >> top-level GDSCs exported by that controller. This conflates resources
> >> needed to access or operate the controller with actual power-collapse
> >> hierarchy.
> >>
> >> Allow callers of gdsc_register() to suppress parents inferred from the
> >> controller device and its attached domain list.
> > 
> > I think, each GDSC has a parent (in the hardware). If we don't represent
> > it in practice, we likely need to fix that.
> 
> The next patch allows setting a precise set of parents instead. Perhaps
> this commit message could be improved.

Or the commits needs to be squashed / reverted. I really don't think
that we should have a parent-less GDSC.

-- 
With best wishes
Dmitry
