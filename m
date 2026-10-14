Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AE5304B0
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984932; cv=none; b=fvTGsXtxVwKLLpzMKMDqm26ll3cpRNZ4ccjHAfyVzbe5gBKw8665tSRDZOubsXFn4UQOtx0kA0T+PUUTMYIvBQgbr3cs8mqtxmnPLtheeqzrA7/FiefprmYOxGPZfiYKDFl6Hg83lJKS9NB457IQBzkQSwUbF1E08S4f3KbAvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984932; c=relaxed/simple;
	bh=IlpqbHrz26EweNTVebA5NYWFDrcc+dfp5s1FMniEugU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfInNj2dLsUMcmrYbVm+LA7ih5cQ+1zRfgQofvVv5OT85ONEM4E+8VA2i6epzWSLnvQM3XvFeqmAjSbGG2ppXWPHylQAXQeHE+gkKuM/Sr9CTnehPhbIdOkqQfP7NSu9c1DIXpY81oMxO+qaZ264MOAnTvKy9yYkrMjOKZ6ybFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSt/rCap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJFEWLn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSt/rCap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJFEWLn5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHwVP329088
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJjtNP80ClUlRJQPIJ5xMzy
	E/SdWULvgaeOPu3tEZU=; b=YSt/rCap38oBSiDonvSoUHWYieDW7AA788/GQYdp
	XLSfI7xGEpPtB4boX8OLXzQDk+fVeGUQ7VGylvdw5mgsvd9T/NLoAD3NtZz5ZzP6
	3wnXds0whZCrHtYV0mWJeCYyHLhzb3sCEgiXlkbBhTZoxbvHWKcUQx63iEvUjaZh
	F/V7B4RRVZgCvCVQY9FnsUCjgsEQ19i9Pnp30oJncktV7Z877VVQlLA1zzTtyGVs
	faOK1oX1MzhSSMddM/HEB4wZF8JNZe87v87lecWDb+i1UKYMjSp/BC2bNZmk5Mpa
	und//Lrbq3Z41nSs6BTvUMWOv5BqGngNkO1wphfdKQe7cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf029j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:35:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so62596385a.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984923; x=1792589723; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=hJFEWLn5Fy1GIWDvdvSBt7iH8SIGtTvVaNW3zLLBvFRE/0U1Fdel/pI5BL8MPGNf+a
         GPq9q74Y4MnBr6g6t7ITrniUnVdxnn02/t0hMGUNpSScZg71srjiJWtgbh2HhKlgeur+
         P2GZgJpSayHX8/JbEDNdABbQDRQaxRz2PcR5eMEK7vhMMh0BgLaEPNFRD5bEU75filsz
         QsPU8bU3H72usrNKiuI3BxY/qpUPbATVZitSeTnX0Dmiz1R8378QKKoDtxGB4fUhza1q
         xbijc8GilLs5g9T5SG7Zz1scpuZQpSTnmkM8BKJN7JSuO8DnVCwC9ZCnBetl7q3QkWOD
         lPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984923; x=1792589723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=Pp00vhKhiZl+EKPuBxdguqts6etgY2i4aUjBJbX+saaBd4lQDcb1Q5nRn8vwEYFkUY
         e0uR/0O3K1KKrnbvPz8IsJOvaFShRcUu8kCOZhIQXG4CQbVwmmGC4+bOYSZ/a85iNvdg
         uyT69cqbHBiX/f07ptCGStRUhHiLgNf8vwzXXe2vPjpragwBehjY4aPjGUNHM1nwRYzI
         tcA8RfUf6R9Wcdafnv2JYLQ+RRiditxwDYCEQUckE9N/htD+I5q8TIUZlpDwG1+2+SSi
         ltukbIGk7ZjJaPciCW6+Xxv4999jhyKFzLU/lO3o/WAW0CkP5NtwikbqV4N1X3wP/3AI
         SvNw==
X-Forwarded-Encrypted: i=1; AKwUvBwQvI5Vil8GMXOai43XBFdkwzN2B1cAK2P6SRGc9Keb3v7OUpBOYN+u+611mc382ER/fJPVavWltffttg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIIEB4TnEx6iaGrwhdqNe0mqb8aTUGZ2bNn0xrJTk6Xtw51Ejrn
	fhfVXIGAYXggRrAaLyBMtRbcwUUtRjXXKfg7xiLgIEDsBlNkWGnd2nSn0rBGjydsJe+bLDjYRnh
	pBogC9phzSs8jKedbYg6875g6G0p49utwukLIDE2HjbGdll9V4vEbRWk3byWpHFSr2w==
X-Gm-Gg: AYBFou3REsZkqdWb5RPn7Pjy210CK7A7Z0qcAHhdP0huKErRR9iLjckn9Hu8anA8pi8
	dMWpBIUMvUHYb5r4t0aWl3qM1+aFeFz6RjTY9D/zf9OKGbKlgOPbNtSoYHI1GPkHAaXIfSFjlsG
	EeuJ8G9nql7seCNBo249KFXj4uXRejMsEkkw8wAjqGwjidH8LwOFdDDtEWcbT/o/qbKpjQLGSJF
	OYn4xDvP5xJgap39fUAudOmNUeWKAP+jzX2Td1rqahltoWtCBSeE8NvDbOIsCgkQNG9CHMCqe39
	d513theaOzD4hJxCOB3LR2fpytM/KuBd8R4uCJsFCtFHAY1fiQjjWEZ7iyvabhZxb7jfCTrOmRE
	UB2LPHqE6QGxltVT/LLp2ZMn2/KV3huBj4X0LAwQeR1fCP44jpzhbhB9iMpkBLld7z959UycXnd
	3ccnHRbWNxr6Zw
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236552985a.67.1791984922461;
        Wed, 14 Oct 2026 06:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236544685a.67.1791984921806;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm662845e87.49.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX9ZRp7LbAKDv/
 hooRtL9ENbE6GAMK4foJrlZTEHlxuPu484Uc4hQ5SF+1GY+zS9TVEwObqgffdYxkOZbqrRegYYy
 p6fAhLyGe3w7m1pc+lql2AhOXqGH/qjqiQq78sNVhJRuLdcS6Bv5X78vqwt20yLkMqet3f7P2cm
 7n20IetNJRz5T+SRSwoo4ZNz2rckai2o7kJ562BazaRqoV+kGtfSogHjrRYX2nlUYQ+Mw5lzBSo
 CluEbu8c3Nba6mIHdbQbSGO1Al8kBi7SErpFL7T4Xht5fu+FGSScxwBdzI8P33LKomw9gMPNpR2
 XtNrqYZ8uh4K+J7o8VewKGNb48Ou/HjaF1WnYHHK/VZ/jOG/PKoxQNTfs3NUK854WYMoLRWXFKb
 LyK7K6qjAfzC+h28wO49wyiCVeArel6B/HK3DGRRdyIazmFRJveSuq28uJ7kEOCZbO8Ko5So9Ev
 kl0guoyHvQH41VQJuvw==
X-Proofpoint-GUID: qjD-htoI--dyIzgou4brHmzLDKeXgyh-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX5tAAkNiNvL9a
 H+j5/2VT2gKmTzuU4SyAw6wAxIHllEKEvR8T77llj4/qGJh+Y3U3zvb+xxYPbfWEuIzXt8vK9MV
 OFsJOzuFT6rolSsLckFTk2mGCms2Tms=
X-Proofpoint-ORIG-GUID: qjD-htoI--dyIzgou4brHmzLDKeXgyh-
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf851b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3h-aFR46GQ2hTHGVm7IA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140054

On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A failed OPP transition need not leave the clock at the last successful
> OPP's frequency. If hardware changed before the error, the default
> single-clock path can subsequently skip a necessary retry because its

What is a necessary retry? Shouldn't it be: try, rollback if it fails?

> cached OPP matches the request. It can also choose voltage and dependency
> ordering relative to the wrong operating point.
> 
> Treat an incomplete transition as dirty and use the observed clock rate
> to establish retry direction. Do not trust same-OPP or same-rate
> shortcuts, or allow table disable, until the state has been reconciled.
> 
> Limit this to the default single-clock path: custom callbacks can have
> additional state which cannot be recovered from a clock-rate readback.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/opp/opp.h  |  2 ++
>  2 files changed, 65 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry
