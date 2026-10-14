Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAF5304C0
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990131; cv=none; b=sEBdUG8gMEV8RnZvXsf272u/kfau3l4F9Ay0pROhLULaM7G9zYPkypXnt9yPTRPh/FNUCRXuIL6KCdteR2M5OtO/SpMXvx2NyS8hzqzFCiwUpyUp9LaYAuu9S132aqdYxFuVZfK1kYIQkZHaflJqIZugnoZ6E1LOJ1S3K6R1A3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990131; c=relaxed/simple;
	bh=D6DSOaHcvSq0t/JVKqdCTLF4wlLhu48+ANiIihPgiqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeGbasahY5nEkoWNdVRYyREbgUBDnV0WqjFr8B6JL1SS0xdxIrRZhBrS7zhdPbbIO9xym6cnJrIMXupzL8p1w1vOroE73j0NMS8zADjayxmo8obdjWz7RuTPK7CldvT3Zvrn4GiGjXgLEEZzkCm51WI1vijIlVu2r9lFkiT2DRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nckwyOJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDaSabrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nckwyOJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDaSabrS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEagZY500328
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VLs9L3lY/vfTjFsZ1UhtwMXv
	kTr/rNAuLor1fwi1wLY=; b=nckwyOJbBmDHevt0K852xtIcZq5G1mXGcllTXYTb
	Cnq8fF516yDCg2QhzN1Tm9RP5trjnbR8SMDii6RzLOjqj47RIzIBBgygnjTA2Ls/
	xSf317dJIuaT0db/ktl7N0c/2gBz+D8LXAGkSKjTAyi/imVDiisK6L49gfZjegbO
	/z/Fux0vxeRJN7dU3gjghXRFFosrrZJFrLz3FmDeP8G6Zf3/PPmiEj4awPJSxr/N
	eJL9+8ZOYUP2Ly9iu56xGtKH5ybukDy52dBox6fS2OinwvnwVg5nQQCU9r1JS6Vz
	Z1xIXqXBHXqQNdE8a3YPN97145FjQQttzi72kWdCJ8fcnQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0dsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:02:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e5a0ad2e81so5091822e0c.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791990123; x=1792594923; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=DDaSabrSMVSNneC4l+bIOTaWy31WhBc+Yh5zaLNYJEmcvnxNxUL9xjuR6L8YDFAzzr
         1wafzNZdcGwNO4JuhIw9ud5r45Yv1b+mULABK5Krnh1YPAHRvEbvJhyjfFZ/9txI70jt
         qF9eIOFzxKvK28/Q2RbNittqCSumKRC7YJ7fRgVVcYTRX/R1Zb9BXOF0t7YOewchvRPe
         rkKv5HJo4Et/TGMAfMY2U9rcBj+EwXpoXjvovh9IQdHg7ML6UzxT8lMyyW2V2hy/6+JG
         sOdog18VYNU/FXa0ksne3Yif/hxYLCqyd92+VFGXp4RcHJ4+E3vjUzs3kwmLhd39wndV
         JXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990123; x=1792594923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=Q7K6H5uJNJKTuisL8flh8lGp1oeC8wLoGhn34h+CPfbS58iNP1kW6L/ta3hg2pWCmM
         CnpaMsRxZ4L/t+A7WgZmo9rP47WtWPR+VTBppoIA1us7XjBbr6LfVR6EyeXrYxnQMMo7
         A4B4aJGapOStUKTlEPaKfsvHooYImPLKeVyRiMRCIxfr4MwFAWowN0zHpplkb35h99Ou
         y7MRPEGUmHSO8kmMk9rhZrYibebDrKrNhIEPxsAl/iJagM9EDGLN3k2XCmqF40V5FMBr
         lFNLcQ41/DvGy7qwburIbDeuokUKCppK/GyNhU2i8Nwpblwpk7oWD6ZMgDlBGeZmDXXJ
         0NcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJW9QtcSzvlD+/lSOq9qtPxt5YqWFj3MwqVXy12k1+P8CsOYzo4CS3OU5mFBL+zewpsIyjhEV2awyyIw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLdJsM2qzZ4fFk61Ine1K05SaojygDDFeRRO5YXv500pt1hZlHR
	lmxPSwzc/1YxQR3qQQcMyIbbJc/AkbobsGQreXqf+HO7QxxpZlWgJ6+3+L+mwi75Yb+zn3j4Rfx
	RngDAILb7MCTB4/BAVRJ7Cnl8EAMQ1vEDVRKGTODhH+CBQUFFo52TkfzoXDHJA1GkBA==
X-Gm-Gg: AYBFou2RGjIPN5mM2TQoN03FzF7wLPVp0alSuLRt1GvpvKS9IBH9CV9wJZcfZ1pZN7g
	WLnFX1Ph3wex1cWgEGIsp2SbfNr1aPSxXZvZTmRzS95gG1YK7eAGWOZo9rHBLop9ibZQKKOJKEK
	ADlKPXTY3CwRpuy0gdLu+1y98zw+08VIQBEnH9MGnb/J91b541KNsQ8OQsG9X6Jid3yVi1xFH0n
	4cNpYmuFoDcN2Bg00BKQkGkFP66grgi0zg8XSPjC4Ca9pmopdg27y5hYd17fKFNoRqQaxExeQIx
	ppymOnSU/i34EnKmj6YwDzqd/Bkpvs7LRf5hFxFtsfbSJWpv79pTvmfSv6iiYL8r168C+Eipbqa
	1KwsFlAt3uAJAB3dPTtpe0jdVYIAucu3PRYtZUueVlUsPM15bXfymYrTvk9fJTapvruhyH3QEb+
	pEihy27OUz8I66
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417853e0c.17.1791990122853;
        Wed, 14 Oct 2026 08:02:02 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417712e0c.17.1791990121807;
        Wed, 14 Oct 2026 08:02:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da3ab7sm703310e87.83.2026.10.14.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:01:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:01:57 +0300
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
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX8RHtrWR479Rf
 DCkx7IE9H57hywYEcSeLXe8DnzjheF69PSUwzfEdgKVlOKqLYN3+NoivP4Y/0VkxK/kHSBJ7QmW
 XWBe2Om5LIP14YsarrfRN/lAJThCLiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX2BNQihSXKjSW
 Syldiy/volbhFKUCICP258eHMyYA+AV3hwKv8HMLkYJNZOtqamAFclgdvLEiz/yVroOtB4IVdyP
 9bGnK5LFpCxh5GB09uHb5G2goKdLRpVxcN7Q6x7wbqEvbsoR79nu5H9jWgeffIuH4um1VLKF1ri
 6umNq5AZemFBGJUIdrGFRAivwVZxKpbN/bD7FtP/uQksaDRo3Wgj+qP7jw2cA0CU4QTnkebg2IT
 wFtpo+K+QiksEz835aTqnSWEo31pj2jtbtipAe9LFoNuEP6Qzk8Y3s/Z19XtjC6NZY/uaNVgB4h
 zDq0DVwAgr8ZoDUv0cZaMd9F/bucVT3qC0nWNmpTrpGma5TBL+8jKTtiYFcCti9qWOi9KblzaMV
 EfKruBv4NQsqcYjAru46T7fcW6Ca8g==
X-Proofpoint-ORIG-GUID: xYSLc_G--1Wgj3encfgTW1JwtAa0HlN0
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf996c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FrZRtYz5i2LrMhXnUOwA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: xYSLc_G--1Wgj3encfgTW1JwtAa0HlN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140059

On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >>>> PLLs. Without those connections, the clock-owned DVFS implementation
> >>>> cannot attach its voters to all required domains and controller probe
> >>>> can fail before any clocks are registered.
> >>>>
> >>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >>>> Assisted-by: LLM
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>>
> >>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>>>  				 <0>, /* dp3 */
> >>>>  				 <0>;
> >>>>  
> >>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >>>> -			required-opps = <&rpmhpd_opp_low_svs>;
> >>>
> >>> I think this is neccessary (at least on some platforms) to keep MMCX out
> >>> of retention. Even if we can drop it here, I don't think we can drop it
> >>> for older platforms.
> >>
> >> MMCX exists precisely to let you turn it off, the clock patches
> >> retain a way to keep the clock on during the runtime-resume of
> >> the clock controller driver
> > 
> > Turning off MMCX is possible together with suspending the dispcc. If
> > dispcc is resumed, MMCX should be at least low_svs. On some platforms
> > it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> > On other platforms MMCX lists 'RET' as a possible value, however it's
> > not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> > exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> > represent it.
> 
> Retention isn't a ""real"" state the OS should vote for, as the HW
> downstream of the rails generally needs some flavor of LOW_SVS to
> function, or at least I don't know of any such cases.
> 
> See also
> 
> 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Ack, I missed it. The price of doing OE instead of kernel for several
months :-D

-- 
With best wishes
Dmitry
