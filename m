Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794491184;
	b=tzSxDW2mkPAgrxIjt0PRyZLbO6REggzZzWOLF43I1/4FheAwacHruskhGcWSgPb7AQko
	 TH3v9XiWTQEZXCFk9WKh0FHZ9iJd9OwPLodpUqIyyLRLOcmMqugbvoAnuH+UUJyH7viEP
	 rIefgYap93aM8BuOrr5KJKdhECBJO//F3bte8eZITq+pYlEiuuO0o7RgFQIMzOOFhOC13
	 uvipLM3+QLk+a9SI5WGHOi05iCHq0rF9l6Fz1bIG+Cb3B9cGCnFywFNMGEIarUy8t9Z3d
	 Ox/X643F1T1lhmF841IyxGT88tD1SBCF5Rfqyq+Scj44DK2GA27bxWif8gwq5FTD4xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
	b=eGrUA2ogLmdytYgOncQEj9uRftH7HrjvdrScA1vfrpdLXQ2ghstZZxzqpxdqKbLPATuP
	 i30ZL/vPxyJY6KPzoedYth6br0uYUGa0KjmMY+xsFtXi5IBq4g/5aOOIy0LARmrwjxcao
	 iFAFQjNyD8+t6zBBJg1JElwuTMrssRnZFjiCJ7OFY0EBlBeZJvrAUe2RbSNVlPit7aHdR
	 a9W3CLr0ENuZCAbRiQeze3zHnKYhNDR1gvX+wq4nu2GhY/ECOfAvOlJy1/7qSyM1ABmS6
	 wMETUcdYdgIV0DhVh85UJYMpqUpEoyrNFqRWbMxf58K31bnUV2BxL+9SidLUJ29rIWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUZDZq4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNHnxVmw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314B606A32A
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C314B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUZDZq4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNHnxVmw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iuqd126100
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 13:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=; b=JUZDZq4wPcio41pj
	obsZMATGPBHIGIxAcBSBTuoDE3rWxdJrFgbAcAzhzCpDMh3jZGuHuCejqa4ThX8E
	cj5K6qWRjCI4Cog5b5V/Le6R10fPfr567mKKjiFzeog3vimflcYAtpkUOKvvyWTD
	klGjqKEFCDVF9iBy0Op5OfF8yQlK3q3fqf6rHYMDE24K+lB8d8xXdNgzaIKLkHba
	4UeQLqhMY7oIdL4YgOJ+7xmWccDDZNaiWz/OMyypmcl8Gyryts43GMC80jgsB6Ea
	pr9IXzoX2obW5P5OYooD5od0wGd/lXod2fHnX8pnxVJakB7c2A74B5kNOGuSQpn7
	qvm23A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a098h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 13:46:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso1608556241.2
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 05:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794491182; cv=none;
        d=google.com; s=arc-20260327;
        b=cDEMn0oF3t34arVjkH4NO0O8OBptyFmuJSaA1NA0L9X+eHTP1pHYCzH/19vLwbX0ov
         cG89CgeuyzkufMEzTgNzAAW/CvuMN9eUziU737vxNR4d1gfD9Yw0WuDD3N36yUkUMp6w
         4g+LYoyFrosc7uVps1TG7xOTXfR6z06fj/h7HiXctJsImRtZRRd5/eqy8Jd/XsOBRJqr
         2fJ7ifYQQtVXkaPQK1TRn2WIIu54B+5qghg3Nj6vB3QCaJvrjO+AyyiaMGtGlpnEGvWd
         bwitSnzf6NLrvQmK+mBYOK4ZeAr31IvRaWE9B9ok2zqLT4I9rS3ONqkz+wd8fPfVlxIr
         gqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        fh=X25QEb6dtgIDb5NUgDpWiKoV6sua1PMWn6yVqevaQBY=;
        b=B3zN2MrEmatmvlq9oo+1CK9cAyfvMOieaXONH++7gDruQ0eJav/gJA2tZPanuFWo1A
         2Ty23GVLQedEqQ7wW9KMH08vrhqfbHPVtvYj3uasqXp+vut0n4ElPSijejwg+Jh2T7ZW
         BoXLk1VtVyJExGB48yC76V+WjwCX7Xqrj+yOzr2PkjhWKP6ES5n2/0oBuHtkk6kj5OvM
         TPsghNWqBiAska6ERCVvRK7ANuCiBXiN/FXSdJMaInH9zjARA804dZK0ZG2JG1s/bAtf
         JuTS5XvGlN8O2Pp/VFJk52VqdZck+i+OOCI01mYuFj4wKSyUvl7lNBvf7fb8fOZzJUOx
         vqCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491182; x=1795095982; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        b=MNHnxVmw1LLhEk+Na2mdklOR30ieCCeCAoqTRML9JMu1JIN2GToqtZMvhlnRaJ4wYi
         pC40MuUkYOTrrO1ngepKYWta+Qwnj2i3l9IDk3ua2HdNBRKKkYDPueYSVuVJAE4yavwm
         Ww/VNDfaFh23PaogIFeoLg3KL3cQPWbthhogfcCZFQyssPUel4UWsefaAf2em/Vdaw2C
         yIS/NHAaOtwQP9acxb/0ThtlN2Pp7zdQEXCGafHaqYW0ymCobxk/vQArISZ8Z/1wPvxM
         3HSYzbtvl8b4aLHyoCutZVd4CRXybC+6uwYGswW3ISC0G0zL/XzrHQy5d8QXkUIFz7Vr
         Ak2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491182; x=1795095982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        b=o3g2VCoWKkMKfDs5REdw+glD/Q65KZj0SXBT9GLO4Dpcl6NbEZUDQHc6JdsMY0QT3+
         9aqd/8iyIDMp3jSe1qfxyYLZmPx194JzYFQFuFdkzR2Z0IRYh0cepx5DcWbmKFayoFr8
         7EdgL7v78ibfXwzlQWHp+KUQuBZA7k0XJ9aL2qg9gEB+fIcIWVHagSzcPIEaXtkBeTxn
         QdN2uw2wz5HQSdRGvB2nIy1SqILXShzp+gZ8BLurCk6LdcCaCkWIuLq3G/oVWZvlMCu1
         9L/b8aK0fpLMTE4go9/sdKjj1bi/Z/5nh03PD7j1y74cCKN2HLZHk5lye8epJ8NH2Q+z
         1+LA==
X-Forwarded-Encrypted: i=1; AL+hErE/9q10DaIj9bf/Pd1vBAKG/4xTq4pfuIgDQGYVCMnmwWwTYOmqzeRyYhOGgNrku7hI1uuhyuUsyhFqKQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9N2RpJfTvZdqNptoi2gkQMzFD4zC5oiZuGXPshKx5CZWYP5j1/
	25rVeFpGHAp1eORPjbXzXDFidHbMGHTcbjaUTFtmbBkzf1n/8J6lOu7z0PrMk9nFl8pVwwTH4X6
	X4ijNNDcKphJYej5qxwuCIpDHdfEFNoh1iUNVzU+wqY7pIKxSgsw+IhfLZ65uRpwKX4FSDSpuKR
	gYGhteV0nzbTDPrWb0FNllDiLay0Dckvc24c9P2ji0
X-Gm-Gg: AYBFou05p6jeUtWUg5jKR+y62s5g3qEkPpSaJBHVnpJ/QG06rLQCskA8DUibHe0sxzk
	etZ+q83wacwj9Dhu6XbJyzXn0a0Dq52pbRwcanTSo4+vyxPix3WxGzywB24oouSvafH/RkzTpgt
	2pA/qvFirSYAlVJcLtioR9fCdFaLU3Crk37qu2Ih6n+wWTHUXzg0grS731cA==
X-Received: by 2002:a05:6102:5125:b0:7cc:b246:31e2 with SMTP id ada2fe7eead31-7d4fb2c9173mr1852001137.22.1794491181847;
        Thu, 12 Nov 2026 05:46:21 -0800 (PST)
X-Received: by 2002:a05:6102:5125:b0:7cc:b246:31e2 with SMTP id
 ada2fe7eead31-7d4fb2c9173mr1851995137.22.1794491181313; Thu, 12 Nov 2026
 05:46:21 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
 <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
In-Reply-To: <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:46:09 +0100
X-Gm-Features: AclHuK9v-Z2mRtAMjRJcbnHzQlkhFHOVGuw0nJq8MItVFsL3rwXN4A5fUjGnABI
Message-ID: <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 84OwOVO88BjtulPdaq2TgsaxMX_it5Oo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX6Tg7utn42Snu
 14F9ADR94dOe4HJs/NHH6UUu6BSl5mteNoMc05dyvhAlPVURDJWSrwAJjgaFJ/wSG3Mn0/xeEjo
 9RlnlU30G3G9Sgs2iSctc8U9ALQbtUnm48KH33ZUbJZVR1fNnpnJRCkY3ny5aRtNTrwDCkiEmq/
 72tZYbqwoXiP3V+7Yc38Mx1EWGLuIKMNw2IprjGF08s9g4gQ19NyGyEX5yivMUF3sd9YGwmiRVj
 nE5DQrTTpT0fZM5zHeuhiXTr8vxDhwW56XFyhNTyNs2VZtU0rfi+ScM5wyQV4B5pHP4SO03UaG8
 Sxq1SZEEcr9kcz/Q2D+dwEn6HnbWJ4oPr7kYQ69ERxyDlYk2jvGecfQ17clxuxtdIjviRYPgx6E
 iU3dq7qg/TBr7o4ygbFAg17n9D3m1Ed3JR79OBhtA8NSIfZYQolXWD4o2eXRN6njFdX5k5Z7ic0
 42m5uJW4XEAqI5zDanQ==
X-Proofpoint-ORIG-GUID: 84OwOVO88BjtulPdaq2TgsaxMX_it5Oo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX36A2Cz0qbqDR
 3nL32i/6C7jSQwquAthhr3JDuYRwehaw/jh0O6BbWMN+5ZZQL19a1+tqOTVf6mwksqWFlCR+Qlr
 nh3o3ch5aTfIAA9qe7FIcW6Ypqj6pFc=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5c32e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=khUPejFFGLYla_ha6IwA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054

On Mon, Nov 2, 2026 at 3:47=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> Freezing devices to take a hibernation image and quiescing them before
> jumping into one go through the regular noirq suspend path, which arms
> the wakeup IRQs of all devices that may wake up the system. A wakeup
> IRQ firing then aborts the hibernation or the restore:
>
>   PM: Triggering wakeup from IRQ 180
>   Wakeup pending. Abort CPU freeze
>   PM: hibernation: Failed to load image, recovering.
>
> On a Qualcomm Glymur CRD this happens on every hibernation and every
> restore. The WWAN modem keeps asserting WAKE# once its root port goes
> down, after its driver has shut it down for the freeze, and the WAKE#
> GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
> default.
>
> Neither transition is one the system can be woken up from, as nothing
> goes to sleep, and Documentation/driver-api/pm/devices.rst already says
> that in the freeze_late and freeze_noirq phases a device "should not be
> allowed to generate wakeup events". Do not arm the wakeup IRQs for
> them, and only disarm them in the noirq resume path if they have been
> armed. Wakeup IRQs are still armed for the final transition to sleep,
> PM_EVENT_HIBERNATE, and for suspend.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

This seems reasonable to me, but I can't judge from a reasonably brief
review if this is the proper place to fix this. Rafael, what do you
think?

Nevertheless, please add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/base/power/main.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 16a1f017051e..34ba0e5941a3 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t sta=
te)
>         trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, false)=
;
>  }
>
> +/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
> +static bool dpm_wake_irqs_armed;
> +
>  /**
>   * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices.
>   * @state: PM transition of the system being carried out.
> @@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
>         dpm_noirq_resume_devices(state);
>
>         resume_device_irqs();
> -       device_wakeup_disarm_wake_irqs();
> +
> +       if (dpm_wake_irqs_armed) {
> +               device_wakeup_disarm_wake_irqs();
> +               dpm_wake_irqs_armed =3D false;
> +       }
>  }
>
>  static void async_resume_early(void *data, async_cookie_t cookie);
> @@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
>  {
>         int ret;
>
> -       device_wakeup_arm_wake_irqs();
> +       /*
> +        * Freezing devices to take a hibernation image, and quiescing th=
em
> +        * before jumping into one, are not transitions the system can be=
 woken
> +        * up from, as nothing goes to sleep. A wakeup IRQ of a device th=
at
> +        * signals for attention once its link goes down, like a PCIe end=
point
> +        * asserting WAKE#, would only abort the hibernation or the resto=
re.
> +        */
> +       if (state.event !=3D PM_EVENT_FREEZE && state.event !=3D PM_EVENT=
_QUIESCE) {
> +               device_wakeup_arm_wake_irqs();
> +               dpm_wake_irqs_armed =3D true;
> +       }
>         suspend_device_irqs();
>
>         ret =3D dpm_noirq_suspend_devices(state);
>
> --
> 2.54.0
>
