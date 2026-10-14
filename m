Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2AA56853A
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999102; cv=none; b=QOnQtqPJP1/Lr488sf3zv09nbJIeFVtHEVvAU5vlgJcLuPhqhluRpjqvBRHNEqRL3dQ3ZlrrE0HfzkYQF0GbXK/IIGzVfrDSOaVFdjvS5mE9nA7sV+djWQUhcfatI1DHPiOloamUZOsv8AYg4a0sOwNDvVwX7aWXM2vhB7iSGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999102; c=relaxed/simple;
	bh=121EF6tgvtQmCI553ZeF6I+UbkvEWY/a0feXoJuQ+5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/BHriHCrjh4yhXNb/N5wQhgFay0hhtC1WV1gM5Bt3HiEZZUHU8FTs/SXjBr74Wb/Ra0Vz2XWrEFpmF3jKrhnjpY7dME3MMZKtiiZ6BHHTyVhLgQz4XnDC5+wqcpCz9rxnikkDS4bIvi/3NMt3/CLbN9/gqrmkkA0/sKz46Lbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARxqgK2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWErSxkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARxqgK2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWErSxkZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHRBgo841915
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 17:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lkj6WmLM94TLi7LkJSNtIzaP
	frHo6K3hQ/enHwG6gPU=; b=ARxqgK2zwJNKzaI+JAXUrYvIyxi3iBuILGUfZu5o
	adNmbIs8cWR5bF1mcjdLC0X2gN9qfEbH5rtrGqt/iiKhw8PLlCev2O7dmQfnMqtW
	pgEsyddaZngCo70WOSYUMQNnAaZ583vLR46QT1445VfJPw9lY4T7uiejGi1miA8E
	w2d08GyguICu3r0vPDwOT11FmEp0dlWkJNcqXBdU/5DC57wcZWisTRkKL+fk3vQY
	mfDam/3cu1JN0F2NWJ7PsquCMfR51cnlosF3wy72BN6NsSGBrZaHHdY9GRs5W8F5
	7qbtWK6e9GOeVJn9BoOdgtVz9Y19ujsO4RSKLLg3NxuYLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wr0x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 17:31:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea9ea9d13so107814985a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791999083; x=1792603883; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=QWErSxkZC6TpERte2jex9rGPCR/OObmmbzF9uSQ4ffIuWkYrLAu8paxZX/P9vDZv2I
         QFoCI8isE34dBiTqlMGWmrF3BNpmjs8rVG0EjhUjvzqoBvgmAqVAW41v0VLEb6AdmIkt
         Nn/uvmv+xTQE8c3bwTrKD+XsoLcshSJtXlMf9BJW1BU1Gm9ivCWd8r/r5SdPwJ9En5FB
         6GcOIet5Jau5WRxu9BDm21WExe11PDyK+xDD9YhrsYam6maCBDGSkx3olw335jAlyru1
         YncD0jG3RB3HN3ay2vQMjxLcXNFdEOWEWEnKLXXL8E0GxO3nfYE2fRUv8ma3n4v4Pti/
         rlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999083; x=1792603883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=lb/XKDVwYQEI61jctrphQqPjTzp3mxlxTGY8fGLAUBcXen2gau6Aw0RkruHBRsZJVm
         MqfwJze+QSshJRAw2Z+aM+KaKq7bGtvpz0nBXChhKhc39nXAcZLWSV5EdZ9Vp7eInvFs
         bRPeIWHqIgH7j3BHV2oHv/bXbBK38iz/oGMDJ/+anNGccNh/NkzOcfN4bkQewgWfziey
         4IYI/xBUnyuoEbUgW6cIj2o+XcIktUVUJue8hXloq+DRmeRQK3s2WAreYvJapm9RhjPx
         Kf1KSK3eGO2bOBym+5UC4LTbQX7g8OVHZon2mdGFZ6AbKra51zjrg3Mvjw81fN0Y4dZ5
         Z29A==
X-Forwarded-Encrypted: i=1; AKwUvBwVjgDlTulQSCgTV5+7bXvwiz1EGrbNpu+Gl758RqNlG0PT2vl5+h9Es+OqgIP6oYvbW/WgYE9fw0R5Qw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKh5fQI+TaaFX3uKejlcMJ2zdDlAtmizUbr3/zQSEx/F6EV0d4z
	3y3Vzv3alMPgPEX6Idu3DOIe9HGgJP1R5TcYnVL09BOAedCeAVOhKCOrQPfT6nqN3fxdKCd97LR
	U2Of6earJ+/4bK3nsrvl9Z5rxWHrtxkpNkAwBLanqt1AxQAae90FUYDAPU6qxR5JH9A==
X-Gm-Gg: AYBFou3LOFmVbJrRgUTmP8ifQ33wbJ4VNgBbwa2Jc0Mz/0xV2B4EGdcvHJzOAwtoIPD
	k0VDDvXC6Kj2dDXk07nxPs6chsGNfs6eAFhgA1CYToa5j49Z7QG+ZD3m32bVaZwKCdEm8HvK7D+
	781cKX4T5VXVpA6McUF4mMWrTcQrUS0btnK+/qZM3p4e8wwO7Y4pcA1GfwFDQLoU34WM+I42nCd
	I6znO88cTuyUwEmhPO08h9MF+UThrHe7NNE1b6S6EGs85PmJB1ClWC+Y1Jhr86iVliZUc68dzwT
	aZSJI4ZZdp2OLAJ7Y02DBn6VrdqofFq6cdE78Y1D9nlSD8kBO+Tdd0siwpKc1EY1+0HN6f89fu2
	x02BT4EAwgTWCEWrf2LzzyWz3Ac+7ZIz1wQ1UDIi0oO+Tcn9vm+Qow2D5xnqkcJ9eDBh8hBIxtY
	UR4n/YYZiJK0ac
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719651385a.47.1791999082204;
        Wed, 14 Oct 2026 10:31:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719640685a.47.1791999081425;
        Wed, 14 Oct 2026 10:31:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93de0sm789552e87.67.2026.10.14.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:31:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 20:31:06 +0300
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
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX2uSmkPgb5tWm
 pmYr8Gcj4WsjC6p6GWmMqMMIekot/fz3919l1sLTsTXBjyF5v2NbAGV5Dx0i9AANbO3un6/nLK9
 52X9SpgclqOPIcRu46EOpSSA5xOGcEw=
X-Proofpoint-ORIG-GUID: aRd4vWq7R55wPA0AU5xfw1xxc8Q-WyuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX2ueAau5b3BIa
 NToINaYMKBL+kkF16YLyc5HG+36/hWN90/dYJr3GNYEZ3mX/vrVj+dMXpzbnkeTjDsRYxFzs4i6
 eWT2V99evBwQYAZ0PPhFd/OJb9xwGAcQGyFtkzy9dVm6n+MHrKTEop24eYd+Ny25/ju/Z0Y+0/Y
 Ep6KWyE67K3ickDM2A5duh0mciH6A8D/PglNPGGjoCyNKEQMjsZzNqRRY8Oh9CfjNYor7gS0Yix
 2jgmQ7Pp/Wd1fMptdtjOQmzCvO+cxxfijjtuvkKxFjtEelZbF6OtRDlyyup+WkboiurWHJagHuu
 xxia761AESVAwj43ISQRyuKpMhZOMgUIhHidXjnAz/yIxIi9eW79LgWL2H1ZzmRllsNLZIgXVvP
 edEZhBCX7GEp0Rf0gYL892qw6lnK9Qb87UXfbrc2m/UIVNg5aURT/tlUhWjTkm+XDZxa35ZuLJx
 w0IFaO/bQkLCuvkMEag==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6acfbc6b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qblbxwZfGeKRjrM4MhMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aRd4vWq7R55wPA0AU5xfw1xxc8Q-WyuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140069

On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> >>>> operate at a given frequency. We currently leave this to clock
> >>>> consumers, so a driver has to know which power domains supply both the
> >>>> clock and its parents. This ties knowledge of the clock tree to
> >>>> individual consumers and doesn't protect other users that prepare or
> >>>> change the same clock without making those power requests.
> >>>
> >>> Why would they prepare or change the same clock without making power
> >>> requests? If it's a legitimate user of the clock, it should have an OPP
> >>> table. If it's not, it should have a separate API to set the clock via a
> >>> legitimate user / aggregator.
> >>
> >> That's the entire problem that motivated this series. The consumer
> >> doesn't know what it needs on Qualcomm platforms. The power
> >> requirements are that of the clock controller's, not of that device's.
> > 
> > I'd still say that the consumers know that they need a certain
> > frequency, which demands a certain voltage / power / etc.
> 
> Right, but the meaningful difference here is that the consumers
> only know they need a certain frequency. The required power votes
> from that don't stem from the consumer's requirements. They stem
> from the clock controller's inner workings that are necessary to
> fulfill the consumer's demand.

Doesn't Iris core also have "we need this power to work on this
frequency" kind of requirements? My assumption has always been that
those are just folded into the clock requrements.

> 
> [...]
> 
> >> The Qualcomm case is easy - RPMH is *always* reachable, so the
> >> pmdomain provider needs no clocks itself. For the other cases,
> >> "patches welcome".
> > 
> > Ok. There is a promise that I2C PMICs will never ever be involved in the
> > clock / power tables.
> 
> Or at least that someone who needs them will contribute a
> solution to this problem.

I meant actual I2C PMICs, like PM8008.

> 
> > 
> >>
> >> [...]
> >>
> >>>> +static unsigned int
> >>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> >>>> +{
> >>>> +	struct qcom_clk_dvfs_vote *vote;
> >>>> +	unsigned int level = 0;
> >>>> +
> >>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
> >>>> +		level = max(level, vote->level);
> >>>> +
> >>>> +	return max(level, rail_voter->safety_floor_level);
> >>>
> >>> I guess you want to avoid having too many voters, but would it be
> >>> possible to have one voter per 'signficant' clock and let GenPD itself
> >>> aggregate all the votes?
> >>
> >> What does "significant" mean here?
> > 
> > I'd define it as "using a different power domain or requiring a
> > different corner".
> 
> I still don't get it

When the consumer votes for a frequency A / domain BX / level cc, usually
the parent clock (at the corresponding frquency nA) also has domain BX
and level cc. Sometimes (like in the case of PLLs) it's not the case.
The domain might change or the level might change. In those cases that
clock must have an explicit voting (I'd still prefer OPP).

-- 
With best wishes
Dmitry
