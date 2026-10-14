Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2D27AC31
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991570; cv=none; b=QWpEfBJ2cLnDGoL3/vnEymMmbAO+JjOt+i57t8oSx9T6WE83F6jnfY8dQo8P6X2Qn6O4x7ZFm/Jmx8eai+3mwFigWGk54rTq+Rb6D/whIZI+AIaJ01pPl2suc9HDJ8CeMuVMXeBM2WJxJh1p/z/XIMC6YfcdbvWI0b3kydR6XoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991570; c=relaxed/simple;
	bh=MgNox4Md7ZzWyjo6WySC3eO5hUras1nROqxjZW1sgXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ym7wA0xTxx3pJHCYu/gCA/T/h91Tp0orsiSDqhmnzkxCYLwn0ZxXOaISElAABfEl9GCJHzbgpOsMj/0Fi1Gs9DlW5qo1yCbgufQGwxc2sQfaFy77wCr+4HPh1drM1747rcNacs/2mFXd25fPhc1ww3jf4dQ6lCM07FQiInvSpQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mv+lG2Xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/s3BcWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv+lG2Xn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/s3BcWi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEaiOX500409
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsI9BnJ1GJjPhVfcszodjRSmPz6tQ6Lvgi/KHCWFPcQ=; b=Mv+lG2Xn0yvc7mVg
	WjDJCKrCrk9uZ0cB7HC72HGG5aoyl+qfKpM3gsd8wQmpwbBioydx2u2Nnn0hBnmR
	S3zmtoD6Q6s1sTICoSXo5M4PY/4hT2z3OrZWGt8uT6vmLb0akIUFQ3m/uPOsw3xE
	WQYFJpMBHuL33FkWpiIvGi25FCN73iSMcbTw7Qwb/YBLFgFRo4x0lijAF9Ea0JwC
	MFsinWuCDrWcLSBmRoT63Wf7hidJzsKZe74UwPUnwUWcNfNWPM2/Vc1A+XEgCglA
	aLZMRJO956+v+tbx4TS4clcizd3ItlkEzPjqPNn64Edvvu03jWOKgsk5pXZhaVXW
	dW4qeA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0gv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:26:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5d44237e2faso211426e0c.3
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991567; x=1792596367; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsI9BnJ1GJjPhVfcszodjRSmPz6tQ6Lvgi/KHCWFPcQ=;
        b=j/s3BcWiUrExSiX+0QuNLcn30d61iATyL21Jor9ZVvqVc5bxsEX98iuEFbAq6MCLCj
         eKxOGQZqQDNkUjKa0xkbjx2cxsY4KUFsWoFLS7+fammyeU8rcbeScFCSFEx48jrPkhCU
         SDANsvnnbPdEMXg9NUUNEFAYYAK91gB55+YJsDNcImk/19kPOtyW1NMG+zgoo0TnaURK
         YUl3ttE4IFpDI5dlWf/+v8jmAb0LLl+TPmp0F+C0/pSn90Fc/+Zoa8F3KWs6jsqHOlvH
         jLngzZFqGa3ozS3TiisOi/PybLa2mJaM7Fbx5072dBM2oOFlh5qk1OF0FVvYIJ4L4b/P
         B/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991567; x=1792596367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsI9BnJ1GJjPhVfcszodjRSmPz6tQ6Lvgi/KHCWFPcQ=;
        b=emJfWVC9bt13X4kt4cS+oMaIhGe6BZqokXbzS7dlwk4pCb10XC3eWOZoHlI99TOOKR
         IIi5bjRRWj3nRGaobzm6hgdEZKmY2OcG0H9tsZ/1e4imek8Uk9nFgpHSc3JlAiGD6GEK
         FZzIoRE/zXfK4zunxF61jRG0H+D4thQmvLlh8fvvi1VoVoUH42wmU/9BNA9x7TIMqDIn
         kkCGDy6EqPaGraE95lMhTYAyzX4sKNlhPIGeeePRnsNGmot89BFsxzySsj/zsFgHNF3/
         bW6zpwBZucO2pxciom3sb5VHLNSNOZxYaWDE1DSnsZtbTI9X3vsGqGCOF+T92OE1plnb
         g25A==
X-Forwarded-Encrypted: i=1; AKwUvByvtXhp9WgojJPACpKI4oh28wzm23qhTfrKhpcfQnRS4enR6x2N7s3Gi4iWTJML7MKnI22PErdJ3tQ1ug==@lists.linux.dev
X-Gm-Message-State: AFq9FYJqocWDWuNN+heKgaZ6TECryCtv/sXvG4Ot203hD9aW13znUu/1
	9twvGXuR7Jtqx2f6f3FZkSA8M9/LHK+wuNbJhbpglmGNlrEl1aWQUjKY5m5e5t2Ouc1nAo4hosP
	Mcilhq8vgxHzH6jfKHngUmU2h5T+/cVuJNiwDSC5TtHSWqmwRZzLO4lLWo9zNA0V58w==
X-Gm-Gg: AYBFou1VFcuA0CX0QHDu3h8S5v2oZwfDMqYFvZrg1dzcN0xKPvMNdjLwYMy6SHZbClv
	N+R7VEpIoLZg2Zdivm4pEUrXu9ovAZ/gNEP1LXB1zfzEk1o4NPoGXGbD6rc/mrwly7/QPzldslm
	ppNSQ2Nea28Tn5t+Twxk1XGa1DZvwU2oQ5zzpDqsGQpl6I7rDcHsMDHMfdptt/Jmbj6ade9JwS9
	IAE5ZA2buJMOLAbVrJZXo45eNCfocY0cgj3ieWlQ0hxRa0mTIEeqPEOoumZWp86lP1aXWk4tM0B
	G6OGEZ4oI32Bq0FtydaO5Zc8/S48gp/JLSZEik706FDBlq7LyKjy6DLwRKn9ldfJEzmEjaRNJ0u
	CxXZGKkhTiF2v2VB1xXIT2Q==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1252119e0c.2.1791991567199;
        Wed, 14 Oct 2026 08:26:07 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1252091e0c.2.1791991566556;
        Wed, 14 Oct 2026 08:26:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm1272817a12.6.2026.10.14.08.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:26:04 -0700 (PDT)
Message-ID: <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:26:00 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX+lHIGK/FEI4j
 itrWl6l2gJdP3mPYSuABRZ4XzA+/zFHjYBdS3z6RycQcUJeAfqrfwF7HyuL+S7nP5A+BpN+CS9e
 /Le4wJHwV36johf2UzQIdI48Evkc0fqQb4vDkzW49gI1bfqOYSQ/ABtAlWxXpM6IxVTJ+UUf1o5
 yqsBMCayQOXQsWllbsksOXkTZYYi3JibJgTZ4N46fJADGAJISy6VCFnd8se+hz6pap9YtNwcsAN
 Yy+gzy3DGpuJlVBseg4oeq9OWmO/1JCIgNqiXgy8kk8cijCij8dNUlYUvyUkvZYFrp4nxa6yCtr
 d4ESXZchY1FTEN8Helek8DUg3cQ7vPyjpsCSn3AJXUzLF+H9sBN4e/hNW0z2crCFX8afl8awvu1
 ajgxthp9JHxsAuLH0XpqWV1+5waD/EOPE7eMzXUF+83/1HOTXVr+GKKo9koQkGilBRySdV8TTc/
 ue7odixiOjYiNzcxd/A==
X-Proofpoint-GUID: 2GDdpUopYD9UBIY4vnJV728zWkZul7LN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX4v+idaJUo5/S
 K6vOe7362mkV09E3Mlyl26Ji4NdN/8oBuNUTVbHGXjMZQgvrwx4UN3fnWgtU0nyEPQGljy5TDEW
 vB/zEYuj61xgzD+MOouyHk2BoNCnreA=
X-Proofpoint-ORIG-GUID: 2GDdpUopYD9UBIY4vnJV728zWkZul7LN
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf9f10 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LsIF7cSu6wHuaSuSEXIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
>> operate at a given frequency. We currently leave this to clock
>> consumers, so a driver has to know which power domains supply both the
>> clock and its parents. This ties knowledge of the clock tree to
>> individual consumers and doesn't protect other users that prepare or
>> change the same clock without making those power requests.
> 
> Why would they prepare or change the same clock without making power
> requests? If it's a legitimate user of the clock, it should have an OPP
> table. If it's not, it should have a separate API to set the clock via a
> legitimate user / aggregator.

That's the entire problem that motivated this series. The consumer
doesn't know what it needs on Qualcomm platforms. The power
requirements are that of the clock controller's, not of that device's.

> I see one usecase where this would help though. If the clocks use
> different power domains and the corners on one of the domains don't
> match voltage on the other domain. E.g. it's not infrequent that the PLL
> (powered by MX) requires performance vote change at a different
> frequency than the rest of the clock tree.

Correct

[...]

>> Move these requirements into the clock provider and aggregate the votes
>> per power domain. Keep the highest level needed by prepared clocks and
>> in-progress rate or parent changes so that one clock can't withdraw
>> another clock's requirement. Use separate virtual GenPD devices for
>> these votes and controller register access so their power requirements
>> can be managed independently.
> 
> The biggest question at this point would be the locking and lock
> nesting. What is the expected order of operations? Currently it's
> limited to pmdomains, but for some of the (older) platforms clock
> supplies are expressd as the normal regulators rather than pmdomains.

The Qualcomm case is easy - RPMH is *always* reachable, so the
pmdomain provider needs no clocks itself. For the other cases,
"patches welcome".

[...]

>> +static unsigned int
>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
>> +{
>> +	struct qcom_clk_dvfs_vote *vote;
>> +	unsigned int level = 0;
>> +
>> +	list_for_each_entry(vote, &rail_voter->votes, node)
>> +		level = max(level, vote->level);
>> +
>> +	return max(level, rail_voter->safety_floor_level);
> 
> I guess you want to avoid having too many voters, but would it be
> possible to have one voter per 'signficant' clock and let GenPD itself
> aggregate all the votes?

What does "significant" mean here?

Konrad
