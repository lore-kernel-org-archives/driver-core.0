Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693893;
	b=FSLjWkHKFqgMziro+SccQ9IFSNGLmB6ilYLbeNncz1KfKiggJ9tXC3NmGh5UjcXF31+2
	 kCqhZfp/prmGZhjHlh90DeUXnDX5bfAI0yXHtEFEQpg6XU0MqFDUGeksAQ/xC0cKw2zCA
	 G4dw/JInYmKJRjSIGRQZPQhHflQIaIjVqrgfphyJ9ssag3jIUwDjqFK7S8NehC2GhIXD2
	 mD6s3ggxe4RYqB7+3TFk4mWB8LlIFcxjdNHWm4Bl9ci5IczK18iR192osKR20roxevpDM
	 hMlWK8A8Kyib015C/TS8SPjWEkDehBoMrblNK/RFvxuqXNArbe01GTFma7DsoXcL1Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DRfn2MkwLmsrutJ2u/53/Djj55REg7Q6Juoy0BfIWc4=;
	b=X1psbjXtleeSbdxH3KF/3z5m8h7xRO3aiZcmdjUadTYCYDrlKsT0jOz0fiXVMk332rZu
	 JrJ1/se1Udj2pC9F8rTp8t+ax6/xKcx6X8TowFN/y02Zrv5oMB0CJWC+gm7xo0lUQ7tg4
	 1YhmVdwF7/QkzkFhh+80+u6z8q0e6tXP8LgwdlOd7OrxOS8jcNWVT4CSEknnhXk1kkq/Z
	 ghUJ9hVxmvpuduZRCTOqIYkvIU84ktW5H73/XpbvCM7W4tx5cTUYndyAfxQckdnA8E8jk
	 u5CiTXYrgka99NcFv899bw6Vbs2zqDlc1NGoWMhsGDzhYZ2ZqIcX+Tv5K5iKZ0kS7/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b/Ezn4ih";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCpxs7KN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB4606A31C
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b/Ezn4ih;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCpxs7KN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMKY3893631
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DRfn2MkwLmsrutJ2u/53/Djj55REg7Q6Juoy0BfIWc4=; b=b/Ezn4ihmX1Kmhfy
	EOIxXbsIia50tD8zpZFYejZjnrGzSnoP7tt4l41CejT+0E/IKBESiaHQ9URU9dFn
	CcnvCOkRSuiUy/vAshsrn1MUvKzR5x2HxqwgWCHW3woosSI2TVCtBSgvQHnTXV32
	l+Rhwsln1IXxYnvH4oYL2lGEiFeujJy/5i9TCc6rbGVhqUobOtmMcBoY4P8jEsQG
	qlygIWKJ7K+H8oHLZzdMsvmoWj8ELGcPabZhhnO97RmaTYLNeDpTVhJeB7WrzXTG
	FIAgl6BDD3NSKgkd04MdspdVk4GO/n5elTqD3h0e7cXEHvjJxRSVJlK2QiT0SoEk
	ncmgfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80p6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:51:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so5465442a91.1
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 03:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693890; cv=none;
        d=google.com; s=arc-20260327;
        b=o2bw7mpJbWQHLgaVsjU6efUtCmA7l5ShQIAJ3ILVdIPvPvtjT+09G4KvpJUn7fZeoW
         +lbM1AajjxjdpcBXnigK1Q39ezOuoBgDcaIowxGu5I44hhVs4lmqwKIPCmpXERO6NRzk
         1RqteqiNUkQIUDPNponfFqNGTDFOdTvf7Ouz5i2bfiFJJY3ihK0TLWbtyFltK+ibLX2h
         7uZ85qs4SZbb0/UfyRPMv/yTKHXuPXJ9KGn4ZnLpWboYdQt+xz3xxNnrkUye7k+G4V1S
         THHxPoQOqRSm8rpSiVtMxrcWInlLZj63Km7RTyptK3gUBnQLveZpxosXF89d6qEeFdHJ
         CoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DRfn2MkwLmsrutJ2u/53/Djj55REg7Q6Juoy0BfIWc4=;
        fh=zhhXl0xDsOMkE4roPLU2sqfm3NQP5Ca2fU5FmOXiGro=;
        b=m5AmqgLcy4546FgO2TLC52JFgKT1aMtefZMEXCjN+KlbDspaAKsz4tIQLcCPIJ0YZw
         OyP1gtJj81K/4KOf0WhJYUHCd7mAMp8cV64D5X/unSyifM0OQTZILEH/LgnxvfBnd6Sg
         cTeoOPBgKf3FuNgtjhCmn6SJHzWvpWPsrn+GSbtQwLonFmxHRTInKqLmer41oDq1RfT5
         47ChAQqbQgGorhyUCebmyND/an5grAG616Z2L/rtzZw3LlSIPQ9Cpa5lPsCkld6bpHzI
         QSqbTRqJeLwFyWZ50LQzu6rRAJzFq3uiz81D6gOg71GLDEPkaKBHeY+zvMZXwUWH66Zu
         +RrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693890; x=1796298690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRfn2MkwLmsrutJ2u/53/Djj55REg7Q6Juoy0BfIWc4=;
        b=LCpxs7KNF1TD8R3zCxPJq7k9mpGGqvX0VJJpz71lkrmIgaRF5140cjjI8/JitIIHl8
         Xm1jbmYLK8DXb1SRzO3QPizGfjUtIxTlyCfD8Y6swaRgwpV3F5erO8WScz0sjedlvDZq
         kGJ849aCKTxYCJxhEfyCKOXUIWlp3XsywONjT+WgP/l5+g03TQ+wiWoZPsg2rfHpg37n
         3rYEGLoUdruBJT/UrtywVHwJZY1oByCGm76T5gCkn+9PL4ATv/XXmtSFXdWmFi0x29pH
         lxXh7JxTDvy4KffxmhaQN94+ZgUopFR4y8uY+4PsSSMc9y0KqD1US+1pCg8HtSw3C8Qc
         xyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693890; x=1796298690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRfn2MkwLmsrutJ2u/53/Djj55REg7Q6Juoy0BfIWc4=;
        b=G2ic6XDIUVcpcuEM/T6U53Ensq614e2r2S+ZOgTwGQkvXgvNZzcTCwshzfCmS5ImMS
         j6A1ihnCwPtPVlpUuoAKJjJdUYBLTONz1J4rhWnawYJd9gj7Yy5kqKyNjqVa/xEPX6ro
         61/ENVdSY31/ZUYVmZQ2DI+uWbfTH94g8nBvyRZMl3aSQw1RvZBAM0HMiqX3yO1yoeKN
         HZxb3sJTxc0nbk6ezjMPV+ZUfvEXEhAZVb/HJh4vVffqlkkHf7b3RJa0ssLJIAu1C0vs
         zEiAUj9w8HcSi6qVLhpSkFy8FZCNBEFKMd0z7vqtkp27IKnhXlk+jVzu42Ea6uz8pkC+
         kn2g==
X-Forwarded-Encrypted: i=1; AL+hErE50DToBOY/QASWPdRiLp8yNNah1xOl3lSPBbeTtGaPm59V0rLwXIaeWJF76McDT2/ed1+inbhxWFyfvw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zxslRGIHmIxl3i0jUWmSi28LjdeIlegkRrWMaU5qVn1uyDJo6
	noSZ2yeFklHIo9c3NsK62bysGEY/X/8XvxIgloUXgI1UUVNrM1IJQm9yCX013x7JGcUz7PyiXuj
	if/Mf9pZ+YxYC9VtAQFFBrkh110g+Eg1xUSGYWmGN04VJvAeuK488tDnQmzNchjoD4SX8J5tZdk
	7mlIxFJGFcGBX9QKILkLTyagTOhy82xXz7Jg6saRMI
X-Gm-Gg: AZFdTZc1D45c88lvUF8gn6pZrt1XJpQ+NXX6BKOsopG+P47W2uHSs1gRZOpTy+NOKhG
	5iCxTB/SS52GbUHTPHcYAJS78rHmLJyfcxFR0CEnPACrDFeqKgm/4s04oe7PmVvJkyLpPYjcIfF
	3FaEWWHL2orSL3AOELY0Z7XB56DrRmH4cmPpRl+UJ5pYZUCrGjMVoRXYXnEw==
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr20370986a91.15.1795693890480;
        Thu, 26 Nov 2026 03:51:30 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id
 98e67ed59e1d1-3b41c8fe261mr20370971a91.15.1795693890029; Thu, 26 Nov 2026
 03:51:30 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <4779892.LvFx2qVVIh@rafael.j.wysocki>
In-Reply-To: <4779892.LvFx2qVVIh@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:51:19 +0100
X-Gm-Features: Aa3M54purnSPAv_lCCDcNWj7ExbQIuNGw6kpLYAci7euUlbWU1CPjrNeI3Ij5GE
Message-ID: <CAPx+jO8d-25kLQw9X0wW4i3YV4Jn+2Zr7_ZOT9rE10D99kPU_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PM: runtime: Fix issues related to autosuspend
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: L4-u_ZVeIrmpY2-hRv-B9wYDYkRxH-kI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX0ngNdLytIH/y
 nw/6qpBRpnPfcZAdwQkZrlj74nMBaEN7/nslJ+MbRuITytQ+2HxJjZGjXDctd00GiQva5A5uHMB
 c4Ug8MvyTXcE7HTXeZXkJ3UtHFd9IwE=
X-Proofpoint-GUID: L4-u_ZVeIrmpY2-hRv-B9wYDYkRxH-kI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX5M1JHdE20ZSy
 lFjZmKC22EfwHBvAAy79FmSV6QNUm0eKCUT3b/hGUWfRKisJ7l+fjdDkZGqU3jta6sz/HqvUI0E
 KLA9Y4PsjbHtGf0AHNd8Mo4n/yLDdw2caGBU2WX/IsSv8x4E4abXOfJUtLIadRHsfla99TFVr1F
 0b56ZfpH58y0OxQxI01MEY6eKLd6aXtKwc0R2wH9/RaQboaqCDGQ7Gd8xdo9zV+cxkhL7ubBrE1
 JHkCs1bEUa/xASAlhyrG7HSQKZxOq9Sv0AX7fjVrCZC4YccSNF31+hsl1YVZx6CPLNmnimedJyq
 54rrIXCHA2AParGNoN+XcDU12z7Rv0bB+6iB1rfWeVpzZUcSKOwm6VlP5SgogC2ZdQS9Czzi4KN
 Y/uHBKpPXgoOmBeAYcVFrwAbq8j3epxjGDvyLNl1ZuiPMbR6AHpn7BidUtKY1zMga6DnkQP3di9
 IDT8Zw4+fEELm/2tkcg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b081d43 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=oTMbCWg2ZTIKbyZXGosA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

On Tue, Nov 24, 2026 at 4:40=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> Hi All,
>
> This is a follow-up series for
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/c=
ommit/?h=3Dlinux-next&id=3D26236a3e8803f7e1ace104020d7f006edb220116
>
> which is in linux-next and it replaces
>
> https://lore.kernel.org/linux-pm/3076901.e9J7NaK4W3@rafael.j.wysocki/
>
> (hence v2).
>
> First of all, there is a potential issue with respecting autosuspend dela=
ys
> in pm_runtime_put_autosuspend() and pm_runtime_put_sync_autosuspend() tha=
t
> existed before the above commit, which is addressed in the first patch,
> and that fix is relevant for the other patches in the series.
>
> Second, the commit above overlooked some cases in which a running autosus=
pend
> timer may trigger between dropping a runtime PM reference to a device and
> updating its last_busy timestamp, which may cause the device to suspend
> without respecting its autosuspend delay.  Those cases are addressed by
> the second patch.
>
> Next, I was mistaken when I wrote this in the changelog of the above comm=
it:
>
>  Updating the last_busy timestamp when rpm_idle() returns an error
>  without calling rpm_suspend() is not useful because the device is then
>  going to remain active for an unknown amount of time and its autosuspend
>  delay needs to take effect later.
>
> There actually is a reason for doing this which is that an autosuspend ti=
mer
> (left behind by an intermediate runtime resume) may be running when rpm_i=
dle()
> runs and that autosuspend timer needs to be prevented from using a soon-t=
o-be-stale
> last_busy timestamp value.  That is addressed by the 3rd patch.
>
> Finally, the last patch updates a kerneldoc comment that has become outda=
ted after
> the commit above.
>
> For details, please see the patch changelogs.
>
> Thanks!
>
>
>

Again, thanks for working on this! For the series, please add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

As somewhat also proven by the subject $series, there are some churns
that we need to deal with in regards to the intermediate rpm_idle()
phase. I am wondering if it perhaps may be the time to consider
removing it altogether, unless we still think it's useful of course.

In the past we have discussed introducing support for *multiple* (a
dynamical amount based on what the device supports) low power states
to runtime PM. When I started looking into how to implement it, I
stumbled over the rpm_idle() thing, which kind of prevented me from
moving forward at that point.

What do you think?

Kind regards
Uffe
