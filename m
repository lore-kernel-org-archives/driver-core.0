Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2000B377561
	for <driver-core@lists.linux.dev>; Sat,  4 Jul 2026 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783144267; cv=none; b=BKX+RkpCG0+RE7AUqpJaukPnx34Bz55ksxiOkPDfyj9yTfa+XMkWf6TUQ67tRowoT0hu81c6SvFfueM6C/fPilODB0VyTvBGv4rLOboB7U2MuNWUp1AM0aCwmZNoM5ij0cpVEMHt5uEVrdrqaAioRTw/eStgY5PhdXVGQlGhtmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783144267; c=relaxed/simple;
	bh=hrDTIMmfyR0bS4ItNIUcF/yfI+80W3HJbfHRHlQb56U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBsPAYhRbS97KhpIaHRAlG2dj1teYmlixMY88oJO92jERJVwZyVJKFud3dvu97Ke+iCBulRHnNRLjYXqgiAlB+BpUR2Gt1XxU/dIXqiSt/tADGxcptlLX3uFtCOE6G9N5lqGBHcBgHn2khp8pVqvFfkT+uKpY1SbBv9/HsLfezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVj9nhfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9YiHvWf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVj9nhfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9YiHvWf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6644dmaM1841466
	for <driver-core@lists.linux.dev>; Sat, 4 Jul 2026 05:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=; b=KVj9nhfpZz/OR4Es
	g3MYKSHaopMTLEN3vkK/DHyyxVOSsg38ARKuvgG7TNmOo5vIsmbY+Jhx+MKJ4DkW
	BqEdnyR+OqQ69kNXJU16xVASNIzhaUY0ySMmQ+3iUlO3L9k4qCgoCbIbpIPcUb0m
	9pWlBlyAllFM5dVdAxTA6oF4EW8j5YzQQh9zg66rL2trn9Jq2FECFe4tSatPshuV
	2w8FTbeflcETUm60Pw+WigujBcVmfzKptw0tHkCAUzUtGsnUXylRllS/eUKQZ6Z0
	a46VgWZy7Dgix4jVASXYcPdURiH1uiaDw9mTfPCZ/XHQnEuqqNkF6q3sHd+6+s7X
	9LCe+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgg3mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sat, 04 Jul 2026 05:51:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so13931595ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783144264; x=1783749064; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=;
        b=e9YiHvWfaDgdAOYtSzw90kIUO1/d5QGkHUm9owjnkZyeiI4hFy/pBVtZSUrwj6Sjfa
         pohQ5KIv4b2D7cSWAedqCqBUeHifjT1fRmnY2hlA0lAijwLgQt22H74mNHj0x6vR5Boa
         Yttt0IcTwvrAPD1fIIlNfVO1pWKdMWqI3VIQ2HmUkCylxaLzdOGQby3ZXEEJB/E8Cask
         5DHMy9+2FITe5Mm44RK1jqR/n8J4FgplqTpZlv9EenWiQ55an/lwaAjmDKZreD7vxkdL
         XrJ+ffUXUXn0yPHRMgl4tWnUbnJSncunmgJ2/7CLaoSMnbIAkeMwOCKFt52/8LYhu1EQ
         ciRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144264; x=1783749064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=;
        b=pXuXlFBNIaHUXCqaXpne4YM+nJIKL6Vgc6XZU4OgFBtWHNAbnIAVwQPGN/flXvIKJu
         ps6Rr0AzM4ETtALYXsQS8jcvYVoV/BZka08C2ttJco815OX4HSWKSCws5t0haqfC0Ago
         ybGzV+PcscmkN+54cma7NUSfXmu8iu4rbkagdpD/nN3x7IKSyP8djYY0pMl8eDjjATNA
         m5t2NyIvSbmVMR2H+U4LVuWh8HpLgEdPhzwkXQRgHCsidjTXuMmYlRCPTWhWcye9mSaE
         aZo/e/+FJrw7LRp6j828a8qXL03pjICyOR4BTYX9WnfMsnXvblaRv3Oy+7xuZJh30mgA
         l2oA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq7u0jyotamvfu/JIIIu9aKw9Ie7bF9dAs1j3pQ4tP0ZHmpxaqR/FnRvHPLvbOURW6TrGvh0L6wbbJGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6TjbuLdTxe+rxx/wkP8Ya/6glYWKqNxa/DO2YqJkVN4DeNaBX
	4jVVx8+budBFpjVA8WBRQA9iOg4rtkFlKArg/InXFBG98440DH+lFUknTIubDo8fdWfZX15KFKO
	ZO4gaIhgHATfEkyNm7W/6MfYuRhWaSpbPDFVAQLVVEcy5FBwsFCrMdorsmiDHn2LuVw==
X-Gm-Gg: AfdE7ckaMbZWYSPq3y49TR+OJBzdca7xM4cmCnp90O4kE4wBBYeWJya/9LSNXS+YmnH
	5DPSEeTbq922PSZY0UzVbfIZalPCPhcgeoqPQ6oWy2LH4f5buyP0S7zTnHki6HOfBOLr4pBCjVC
	HXMGmt0I5oY//dqmvgxyNhouqHWhskn+MlKrdpWsqtBgWkaHEEHS89CPwmHTGx1KKFbxSBaw7e5
	cdBFTP9xLxkI/m2CceLPbri3SE/bYsjnPVhpGshTA4SBLVun9Uo9hxmqVyHHA3o1difqIDkRgfZ
	6rAU3eKPzAgdqkEGLPpNM7d3RU3Wp2l1rFHn5LljwDGKq1k+1P70KFjFwiZJgWWsqHIH78haU63
	tRBSib2vtuv9/o8nTA+JeFebUyi4aAWOYcTPwpqcWNuA=
X-Received: by 2002:a17:90b:510e:b0:37f:133a:3e09 with SMTP id 98e67ed59e1d1-382803b483amr2336972a91.3.1783144263614;
        Fri, 03 Jul 2026 22:51:03 -0700 (PDT)
X-Received: by 2002:a17:90b:510e:b0:37f:133a:3e09 with SMTP id 98e67ed59e1d1-382803b483amr2336920a91.3.1783144262906;
        Fri, 03 Jul 2026 22:51:02 -0700 (PDT)
Received: from [192.168.0.3] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f31e7a2a8sm12120126eec.25.2026.07.03.22.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 22:51:02 -0700 (PDT)
Message-ID: <ecbaece7-764c-4e0e-b490-55d538f8aa29@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 11:20:54 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
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
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
 <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
 <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA1MyBTYWx0ZWRfX3FKX4mksJAag
 F6iW6o3EvEsqHhZwZcmxT4ETnkithot7+PKPFcQKa9ZR/vPF3YlXnoHDje4y0o9eht7o20XNuWb
 sHiYaXkmce7KDfPrOBcBye3UEE/3Z2o=
X-Proofpoint-ORIG-GUID: vAlYNVH8D-eLWoZ4GD3mDGvt-75WtMx1
X-Proofpoint-GUID: vAlYNVH8D-eLWoZ4GD3mDGvt-75WtMx1
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a489f48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cavnWwEOFYD_SYEfP9UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA1MyBTYWx0ZWRfX0YkyEBKof9oC
 JKNtV7pukCZvVWWLrwQNpCEMuEZ0XoCxtmQLKvrxfcde6oukcP32iBKRrdi1NlM/D88n0HoXeFU
 npJlnGci2Rr25k+kSzuh841DIIOJG+sd4iWxZ9/mzWw3acd2+8fg1WsyA3rIeBxgRlwz2gHPUHJ
 KXhCpAWG7M2z+IHgEWb1xcdbNUAXlqZqsZUSgxTSgYvkaUy240qdJhDqeM/mwMkPHeGjjmGS1Bh
 tDpdcxgzyPzW8x3eYjOEaPiCuLWeaXsXcyKvM2pbx8Fa07Erewo0CgX7PkE0vv+hv3G4D2xmVsU
 yQVmSJuj3yQFxXo59P8dcc4iIka13WZ4tDEHsdGLRjr2yCuCd3gkbIHnp9vHq4lrLKGdcGIxzfo
 0Yy+uyru0shVO7zqAfRNr9EuiAMtEGPfjiS8GVq69FfChQ9andhqrEH0Zjud9e0rszfgpbO5kW0
 ZKB8/uwmg5Pq2VQDuKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040053

Hi Rafael,

On 04-07-2026 01:53, Rafael J. Wysocki (Intel) wrote:
> On Fri, Jul 3, 2026 at 5:05 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> When a runtime resume callback returns an error, rpm_callback() sets
>> power.runtime_error on the device.  This causes all subsequent calls to
>> rpm_resume() to return -EINVAL immediately at the top of the function
>> without invoking the callback again, making the failure permanent until
>> runtime PM is explicitly re-initialized.
>>
>> Unlike suspend failures, resume failures should be retryable.  If a
>> device's resume callback fails transiently, there is no reason to
>> permanently block future resume attempts on that device and all of its
>> consumers.
>>
>> Fix this by conditioning the power.runtime_error assignment in
>> rpm_callback() on the device being in the RPM_SUSPENDING state.  At the
>> point rpm_callback() runs, __update_runtime_status() has already set the
>> device status to either RPM_SUSPENDING or RPM_RESUMING, so the two paths
>> are reliably distinguishable.  Suspend callback failures continue to set
>> power.runtime_error as before.  Resume callback failures return the error
>> to the caller but leave power.runtime_error clear, allowing the next
>> resume attempt to invoke the callback normally.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/base/power/runtime.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>> index 335288e8b5b3..70d933bcd295 100644
>> --- a/drivers/base/power/runtime.c
>> +++ b/drivers/base/power/runtime.c
>> @@ -469,7 +469,13 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
>>          if (retval == -EACCES)
>>                  retval = -EAGAIN;
>>
>> -       if (retval != -EAGAIN && retval != -EBUSY)
>> +       /*
>> +        * Only stick the error on suspend failures.  Resume failures are not
>> +        * treated as permanent so that the next resume attempt will run the
>> +        * callback again rather than short-circuiting on runtime_error.
>> +        */
>> +       if (retval != -EAGAIN && retval != -EBUSY &&
>> +           dev->power.runtime_status == RPM_SUSPENDING)
>>                  dev->power.runtime_error = retval;
> Why don't you move this check to rpm_suspend()?
Yes, we can do that.
I hope the changes below address your concerns. Please let me know if 
there is anything else that needs to be adjusted.

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..fab38bc98113 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), 
struct device *dev)
         if (retval == -EACCES)
                 retval = -EAGAIN;

-       if (retval != -EAGAIN && retval != -EBUSY)
-               dev->power.runtime_error = retval;
-
         return retval;
  }

@@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmflags)
         dev->power.deferred_resume = false;
         wake_up_all(&dev->power.wait_queue);

+       if (retval != -EAGAIN && retval != -EBUSY)
+               dev->power.runtime_error = retval;

+


Thanks,

Praveen Talari


