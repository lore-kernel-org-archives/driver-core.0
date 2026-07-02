Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DBF2C21F2
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993209; cv=none; b=O+IVgCwiErmW/Gj2dxBX+Z72Cug6sMd+KiNy2syKl1Hi66qbzvtcpLoa7J+odikMfjSfHkAjYwCn2qedkjQxX8d6F484DjeDdPZKRq7XEaCkWy3mmR4Mq9UbI6LtuK2DJNbVkuubV+iz/SZ0PfLH4m9+mnFT34XZ7ONeOQzyU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993209; c=relaxed/simple;
	bh=iQs/O0m1YoOXpDL1qFq1QeXVEZYVWU0DuKi+oSvZ27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlqEOcmrbEJ07bGsZCeSgDsjVKZIEg5dttD1WjZEIv82UOc3CnC3CA4yXRX85BXOLYU1JpM0w3JLgC2hWEjjEezWxdG3+STM0qD70c5F84oNXlQ4AVp4BCzNPYlsqUnbQD6ez1WwgcRdj2qGDhapIxFdUzFAp8Cx4wryek/ss6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7iI9mpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBZyJP4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7iI9mpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBZyJP4x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AkDNX3592277
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 11:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=; b=E7iI9mpbwfWUnOD9
	cgdsx38NMJSCv/mYBRtxefeHArYjQlhganxBUKL23X+wJH/+k3XOZyoZO/HklzvA
	vC/6G4IAyj8LTaFDCAv8CWDadyFKNfDGynsDPMe/WkuAs+cUJogqFcD++rlSzb/7
	JYp1DIp4eRD5HvUocRuKhvN2eBZ60ZDibJSrBmaM5CRI9AycRpAxPpSyXTf7+Drm
	UXNwzZ6Hn+69s0NcL4LfTtDEtBAJoZJRF2khGpJBsOHTTl9L0OH9KYKz9hn3rdpw
	eWGi1sewYSOwMkBqTLQA+kkN6owqDn9D1AiLfy2CJInIgLrR+cKFuEntyJiFePWT
	R/OCeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9htb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 11:53:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fa907f98eso1941297a91.2
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993207; x=1783598007; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=;
        b=jBZyJP4xYSHyciZU252pc0078YnmVXXrTnNnxG2JCw9AyR1oUqFUTTkXiWEFkh3M6y
         CxjrPy9GDLdxNVhRd/UiGN2Q3b6e4g6G52uOIXTj1t4sdkoioWtOz7EKLzrJX9MGpjmZ
         9YCNtMsLUy0ovEE6RoidWBfouX0iO0HviMT7wGDHdU/OVALu+RjZQ1wj/mHxzOta7z4m
         t0okt4vuNLcqSGtJ4goC3ekhoW2CSlYZ4hvNacdbxdEC77cfdgcBO1RK33ADnEpWiiEN
         KE83ZR0kFiC8nU06D3pAtNU0KRc81t3Fchk7P9ddFyN8VhyHpx1cACpMPs36unFvu3uv
         VN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993207; x=1783598007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=;
        b=Q/7J7ceYuUei1faj0TGpN533cI1jhwhAiISpJ151mJSkbeD+fW+HG3+ABjzsdMuqd2
         dgDTl9+xT8EeywbZaqCq+4o4mCh3zX8/eyaThJJ2GQinv0jzfr3j/JVn4YOpti8MrSN6
         aVz+v8rlGHD7gxZkzzSMX/DFetiBxBoFtItPatDM2f3Y4vVgvxVd+LzOsDVW0CxkcQxW
         24c8luPp1OfAuWCUtt4CqdgZ1vc6k2WdMRRCkO72vTj3GVKRjMb15yVbqyG789YMwueS
         9ltvCWAhtwcq3qCAoRZlrZapmRV9eaoyi4IubhtlX51zxB9bjFS9SGM0FSZv8e/z5G2M
         OVhg==
X-Forwarded-Encrypted: i=1; AHgh+RoP4x8K4nOBpnJuPdVntbIJnbZOxpD6TExSGFld1evgesbEQy7QEwyt/zqY2uNOZNGhVoMMBD5zmpRHwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBTBpXdFxRkPxgeEu33GlObb9CIliwlLlE5fU9F2Z1nHisFcCY
	wu3A6wcxOjTxpAqiYCua/MyqNN/YECir/VO0I9/ZJrkT0RoOwSiJqd7zwIzwlZaZV10JYW/Amke
	WkVX4qFTyWIORHcGBBUeD2J7K37sWuBXcc1MIqcc1hPOBtt2QDiQgUj3ZMptd54XdIw==
X-Gm-Gg: AfdE7cnlyvNSq9FbJ059wgSvkU7A91kD5CJYLmX88IUMXywhZyMiOoS4CqQ3YTJz/sV
	jo84Qu1jdAzzONGybdE2pfrLMR5ngyH5r8q5Gz9eFb1eLJVHew+MumQ7peNpEKh1DxDJr7cQaTV
	k/d3uel2Pr0FL9sSxIh/y29Ke36BTLlbfwzaPZpaSfFVnv2lGiGpDWkesfrQx1Pk8eS4A3WYj1P
	dQ414486YrfRUXjh0ljR7crnRJiZO7dhzRAXJE/YZ8Dy46vkYfZiLkShX6mdnHpgpkFuwgnqgDJ
	yMcXgXVoDzrvGw7WTPYis+cGHx+P3kyr5GPFzlyJYLVZ6EwNK6SZv9aGLvbyvUf7Q+givHyksrQ
	YBC2Nu8SkjAj/napOcqL+s0TA6EDP275A73nbOIqVnf4=
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr5940322a91.10.1782993206551;
        Thu, 02 Jul 2026 04:53:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr5940243a91.10.1782993205836;
        Thu, 02 Jul 2026 04:53:25 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.106.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm15615998eec.9.2026.07.02.04.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:53:24 -0700 (PDT)
Message-ID: <04b67f29-2afe-4c72-8c9b-bbde56f27a83@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 17:23:10 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
 <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
 <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX/NDUYdG+qzHW
 tKNKqXmI6GDIhKL1GwIJz9D0o1wUV52d6ulkKs8D/rDBVYhC8P5PGs4zRgoeAZiVJIMFoqrqgl/
 OehPT3cluv61b0wGLGPX29VuhmohF2hZd7vlWfFX6csEgTONRXLe3Dpr7OR4gbaNyJvTHkBGEBA
 h3T5euP6c0Zp/hB+LrFYwe/VH9Ijk0q4nGFlxuE1jeM1KzABIeZVKxmsljLuu3PzaIOq4sAMavp
 kgNiy0PF6ddz8vi30Xfm63hFRkr+OjEPgUU3vR91z7YFaEkR2IQWfsR150oRzLN+URNgDv3tiJg
 ubYR9/296K7TfpArByL0uTPJZTB/oilUjg5iEMmQQg4HethvzMWj66C7kyvw+UFwyU6hX6eY25k
 SrS7VyAc6kXvj9H39gBXVGWDBP4wlGca4ESO0njBhMsU6NUD6amoO88ZjboPt0C288/sG6On7Uh
 M25IWPnx7yt1lJJpw8g==
X-Proofpoint-ORIG-GUID: 6Lesq7L8LN0QSA2bdypdUSdriT55rLR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX1tUztjPx15TU
 PDWiJWSRsy1DXIXjy3tPJkdgMcSD2H2zEcJlVRRfUmjsDEDwPdfFbYY96a8bVwNN5ZitM/PECKU
 /TInjfp2+Px2/rbVxzxEjTeSGwSAqE4=
X-Proofpoint-GUID: 6Lesq7L8LN0QSA2bdypdUSdriT55rLR-
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465137 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZY8+d+ilh5AZ8AQMB2/tOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fOj4YSts-j8utWejEp0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123

Hi Rafael,

Thank you for review.

On 02-07-2026 17:07, Rafael J. Wysocki (Intel) wrote:
> On Thu, Jul 2, 2026 at 8:08 AM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> When pm_runtime_get_sync() fails for a supplier device in
>> rpm_get_suppliers(), the supplier's power.runtime_error field is left
>> set. This causes any subsequent rpm_resume() call on that supplier to
>> immediately return -EINVAL at the top of the function without
>> attempting an actual resume, making the failure permanent until
>> runtime PM is explicitly re-enabled.
>>
>> Fix this by calling pm_runtime_set_suspended() on the supplier after
>> pm_runtime_put_noidle() in the error path. This clears runtime_error
>> and resets the runtime PM status to RPM_SUSPENDED, allowing the next
>> consumer resume attempt to retry the supplier resume normally.
>>
>> Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/base/power/runtime.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>> index 335288e8b5b3..9811d024d140 100644
>> --- a/drivers/base/power/runtime.c
>> +++ b/drivers/base/power/runtime.c
>> @@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
>>                  /* Ignore suppliers with disabled runtime PM. */
>>                  if (retval < 0 && retval != -EACCES) {
>>                          pm_runtime_put_noidle(link->supplier);
>> +                       pm_runtime_set_suspended(link->supplier);
>>                          return retval;
>>                  }
>>                  refcount_inc(&link->rpm_active);
>>
>> --
> I don't think that this is the way to go here.
>
> Can you please say some more about the specific scenario in which this
> happens and explain why it is OK to effectively discard runtime PM
> errors occurring when suppliers are handled?

This was observed with a consumer device whose supplier's 
->runtime_resume callback returns an error (e.g., a transient failure 
such as a timeout or resource unavailability). When that happens, 
rpm_resume() sets power.runtime_error on the supplier and returns an 
error. pm_runtime_get_sync() propagates that error up to 
rpm_get_suppliers(), which then calls pm_runtime_put_noidle() and 
returns, aborting the consumer's resume.

The problem is that power.runtime_error remains set on the supplier. On 
the next attempt to resume the consumer, rpm_get_suppliers() calls 
pm_runtime_get_sync() on the supplier again, but rpm_resume() now 
returns -EINVAL immediately at the top-of-function runtime_error check — 
without even attempting the resume callback. The supplier is stuck 
permanently in the error state until someone explicitly calls 
pm_runtime_reinit() or re-enables runtime PM on it.

when rpm_get_suppliers() fails and we're already propagating the error 
to the consumer's resume path, we should not leave the supplier in a 
state that prevents all future retry attempts.

Would you suggest a different approach here? I want to understand what 
the preferred recovery path should be when a supplier's resume fails 
inside rpm_get_suppliers().

Thanks,

Praveen Talari

