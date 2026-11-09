Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190122;
	b=yyk5Xe2fL7hfcAr0F/Pdn8i9NhC0F29yaEH1mXLAnbgA6T4qggoWkhKD0C1fsOn9z3HX
	 TLMGnvwrQs5FQMmuxkn6Sr2yGWapr9emRy0cXavYXTo4peDpRZSpqyKlzC1xFC4j8RyyA
	 /IJaX6UW3WmjGUfAiS0RghIbHEl3v4tN8IWQwaAMZ1zjPOdmCAcG4u56puFk3MoAqmhXr
	 42SXkWPSoLGEKaYOAwp7cb1umAnR2VX6byNvcT9km4bAQ3wK098kIE3NJulNgiSBiNIHl
	 YSQX8nESsDDLwnq9V69R+1gFi9NQoBDRtkM1jww/N255WRBBjsS99XE2XuekzepZs9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
	b=bVculhyZT2K+zkHiuWDB8hC/cNcwJLylqOS+ULeJqFJMw7NslLet/FgnHY0Gz9ESVz2L
	 dCsBaiGUXaLLrk9vllofKhtYN/fNpD9Oo38YpRpO1+LNKSXuPGh44NQ07S/tVrf3dC8va
	 sx5kp431b3AIMjwu5+UK1QPAxTNgoLzZiwqvQ++9eIcG9Dov6G/BRruN/qcJhVIfMMTnE
	 KtuzEX3nnoZNj9V8IdW4BySd4asWsl6+SOYETa9phxafC+EZL32p6FJXc9BTawypHfO8+
	 /RCqq8q5SJzGTWAW0t/uiCghbWY22SBkJ/4s7LGhRy1MwfejRx3ja4nnW5fwUv/JLug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MeLMjhgl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E5606A31C
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 02:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MeLMjhgl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HJdg3850580
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=PV4VxcvZEc/NHdbF
	Oe6LhKn5icnqW5+Pd29eXIRMoHDKJgo7vqPhqzCjBKoamE1IyHesxWtw8WJUy4A7
	nZj0prCqfgPFPYjAqVJ6n+xedd9+mcLSUMNV4r3kBHJB6X4d62lKmLufjT/yU5X4
	E9ITpZu7Cbrle+Cb4OQ79RGZWppKr3/1mEu1YTjiXNhAaqSyReX+uvnbyrhXyNxZ
	XO965UFxP+TVR1AuYo/LaWFzh70zJxUDmEXSYJhD1uX4xfEcSPgGnPcNOMSa66To
	M1R1ED9Eo5NJjhQ1hu8aZHYF3/5+Ghw4ERO4WDr4nTxUHFLdQt3352KUDeT2+Njc
	/KuFVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4kg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:08:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so331149a91.3
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190120; x=1794794920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=MeLMjhglmOK0ew+KsLkmNiJ0mJA7cLYdCgNJACD8k16sdjtrNj/df+JWRLm8OgR0t6
         VIPeIgC+9yH/LJEUP8KseUm+v2rEerlzrewccq4uzenxN+SrF1uyVGZP2jRawDEY1XKm
         KB848WDEV/3nP0FXheVZEEfhw3znxK3zTIEkBwR7haSeRj/i/hngynPLk+I4arj8X27l
         NWNlnYO31m+2gRudk20yigiN0y/0mj4Cw3Vimd8KQ6W62MmUXhPsdn20E9ZMmTmbh2J4
         4aT4YJYs79FNEAVo2I+eU3nksmNDvp64QvzKSWOfPm62wEsCabaNYjBM2B8w+/DEMkxz
         shKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190120; x=1794794920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=EgLi48z0n/SVuYO2OPDp29Ptio3IO9Uk2RqlxuoyeuSjnKK30+EFpqc2isDpdoL5fB
         Q4StQ/gvuuxy0LhNxf29KXl2AprETBll73DA6dLOgGRi5cROYkSkfxsnKuXWeA+V3/5g
         LvBS4EDtNyanNgWgSad+6RxsxZYvyydVWremj+eg1daFnNu7y17od3fUHmHUt7lwcja6
         w6sSeFVIlO/DEXOECOxrTptMY2qm1KVdNtfU5Vg1p6xUSSmM2jbnWVuqaqrExW8WLrjb
         v43cDsgYjL+qfYGjk4V1DNVd9nxFm9oTsIY7TEcIIKohsxvQnBUTn+KENpFfhDQoDCXp
         r+YQ==
X-Forwarded-Encrypted: i=1; AL+hErE9Z+KTvmcapbqVkPVLkITVK8RybLMs9NwkwiyA7B6hwA+jFN0mnM00N2F0ljAwxl5EEJ5kYNGem1jfnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0Ow2qAivuQehBJI0N5TS16rheaTaECzcIh4TsRlwCjdJpzVUx
	ZnEVTw+jdPBRxD2TaJLssemJjRwe1+gB9e7hBz7AnaVlDe+IgjkpKIJA7SR0FfZ8zHt1nGqp/89
	erj72LR/aGmM5QHuUrPhLug6jsgt9ghudEHwKYYcqRZEJZ+K6WPBRYruqPv0inkdruA==
X-Gm-Gg: AYBFou1tdZFcFdKbEbKIS4TC6CmufhP2e0hE7mS6aS84pd98lAAsHKuxgmapusBq3XQ
	gqoabfC3CF3amjYSGVeooAun9Qk4bZh60HF9LNtI3Wok/U6EySC2SDVZOJHBYJx0zAERmbkpxZN
	Qhbu/L+uwgyPTdlNuWoq0m7W6d7KR6wFJSj/ewOcgNcgD/2HEeigth9L3txQOHTDZg3w2d9qpo9
	0/OBoI3xsrr7UCQuvLljaBerxfAZ51/Cx7iHWPRgViNLAR3ZIdn7lj7aJC5PPoVIVPaQcWHOPTK
	Nq9joXNt71IswksFTkHbsuvp5sqjkD6JBdUdCVsCwpcfdVEXNZPPeiqlLjk/fxjPSfCueO7Zan+
	+qIhVnaUWkGytl1RrGGBnCHZuoJj3U5buLBkVpU5JioqkDhAJZj+XGrGPOs+RQV3nBKrjiP2StO
	MF/5Vl6e7/d+yuNA+WZUSwcvNxmG3IiqD4g4waYVT7HveO
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158721a91.34.1794190120345;
        Sun, 08 Nov 2026 18:08:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158678a91.34.1794190119715;
        Sun, 08 Nov 2026 18:08:39 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm4779025a91.6.2026.11.08.18.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:08:38 -0800 (PST)
Message-ID: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:08:35 +0800
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfXywponG3jCNNs
 dW3cCa2SJF/Z7pmmY21pIdNJZopYGOPjirSzW8jaBS3jZkuszD7O2ir9IgKNCSUe9UnnIgIvBXc
 AJK+5gAn4Liqx41ASpZ204N4QbVL5Go=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af12b29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=wpr1R3xn-rj-rwNLJSoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: tAT92DCLd4XyGaZVPa-Nb7FAljW0MiG3
X-Proofpoint-ORIG-GUID: tAT92DCLd4XyGaZVPa-Nb7FAljW0MiG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX1fSOzVwNrA3z
 a1kGyY7zJ2xOSOHtd5cbOPVmfmqKgUyBnHRTMYRQZEZNqmbyl/EMHP+DF4lrzQdQmSCG3S9esLC
 az6UjrjOR7H7BRY9hZTfFvtN45lB667oKc9oAWGWw9cKZ5oXgeIvh8jmEn/0sWSB9uxDoDvXdzv
 Yz/wYCI6WSh5tsiEJMed65lcpb/r8dw8wy4s4bcsdaQN5gjLMTx6b6cLKY9rWxvwfl6MAweLlSg
 pzrs3em8f3DdLpqTBz/OOeEDvxrJvOlpDklq2NLMTb7I8gSNZGL8qV17FdzvSVGj6VUZWQrAeob
 KyKsVGQHXnGvpPYPr1ragcL3ZLfqkR/N2vxQvQzAXjyrhgw61v3PtLY9IKQfGbJRMs/OLyD3RG2
 K/gyYvrXyz3bNlnwL4ETiM8uDSF1wuPazQdmM5qjuBbqNbhg4Zf3aY00B9Ok3lpeLc973UzYDMN
 pfXw+M2l7n2/Kez9L7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090008


On 11/6/2026 4:50 PM, Johan Hovold wrote:
> [ +CC: Saravana ]
>
> On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
>> fw_devlink detects and relaxes dependency cycles automatically, so this
>> is not an error condition requiring user action. On complex DT
>> topologies (e.g. CoreSight), this message can fire for many node
>> pairs and adds noise to the boot log, even though it's primarily
>> useful for debugging. Switch pr_info() to pr_debug() so it stays
>> available via dynamic debug when actually needed, without cluttering
>> default boot logs.
>>
>> For example, on sm8750 this produces 125 such lines in the boot log in
>> total, 80 of which are CoreSight-related, e.g.:
>>
>> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
>> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> I reported this elsewhere a while back:
>
> 	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/
>
> Are you sure it's not the coresight bindings that should be fixed?

No, Johan, I don't think this is a Coresight bindings issue.

This is the mechanical result of the standard bidirectional graph 
binding + fw_devlink's direction-agnostic phandle scan — it will appear 
on any SoC/CoreSight topology using the standard binding, and there's no 
alternative binding syntax that avoids it.

>
> Johan
