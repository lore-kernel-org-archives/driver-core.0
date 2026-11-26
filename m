Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699709;
	b=G5/vap6RhWvIXX6/aT1tlUiuufBSRlCDEJdjjeGPvFxqxIrmKCnLziZCpEl7Ucp7x4ZM
	 kyeD3xefUlx7Qb9plsJ5jIj97I8lrbfwjzx1mrTQg7n4vOsQsYNySholTl1nOgTJz3qnc
	 4AlkXG8DWhLQi9UHn/awrEiEmpZYihgygQIiUEJisHD9n9b5q+9KCn9VdxGxXE5755Rh2
	 4zl6xDukVYiCAcCEmH94clPFR0hp7XxyinEh7DnBpHTI7KXCp0X+xMltRq1/oZuAFYA3Y
	 mTRC7gmsG9khnp3qeYDcjsyoiiqc7+npEG56EJgfzw5kVeZgxA8Y/Xe3CAPnXwBkwQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1+I6fHMDuPRbKnrDXPojoIz2V9mnQ+E25HZfyDXGVP8=;
	b=p6vduaP/OWOtSQOUrmuqlUfIMR/cXrxaNR3x2yUuUpbAauK8zvYYfF8o/Q2fSx6UGQNS
	 GPy9ZY5f9RjjI6PrGrLU5bZBto1vGF34bh/iies9HyQVXyTszJERpVDwdww46NQ7Hz5N7
	 EsB4W3VXolrUsXmm4I0JipT73A92t8rxJtLGw01m8NM3hTlc7ZSFuTM/tIQYFffPgbWzx
	 Kk55WrAVouThLTRK6tUdEYMp4AV51LhST13EAs3q+66pZ9ZMxeexW/Iv4gnWctm4pMoMG
	 nFg7igwkwdUJmzjzHIPeB2uztZLdWlLycSSsCyZR5AqPOehWJ33uWSybbZxBKMK8Qgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jeqcw3t6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JX+sn8LT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30970606A31E
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 13:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30970606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jeqcw3t6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JX+sn8LT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUxa2758291
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 13:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+I6fHMDuPRbKnrDXPojoIz2V9mnQ+E25HZfyDXGVP8=; b=Jeqcw3t6sCzKEA5S
	7m1Hu1eZRvWLVR8yKNZ0lsPUJWNMLz9Gtz1/kEdN5Mt3JMWd44c7PuQ4a2U+NIsy
	vIhlYkk/meL+McV3PyPWxdLqrwQpvjmsBCu2PCPfI4lYm6+Jxi1/G4YIMn1LEEwZ
	7Icd+2KYEcmzQPgqSthYEObrkVsSZ90EmnEweTDzHXdIUV/lmhueCzzoNnKCNf+U
	l8ZEz+YkwIoSD8CnfIerj2aP29GoHgdzU0AGy4LEOCT/3xQn73FZF4XGpeaSlhhN
	OsIuT2YPW2Nvgrzry5Kd82daet6ntXWkJxwz9viduff1ieJKWsM0l9yAKNrk/q9e
	IUQ7Hw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvjyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 13:28:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde75c957a7so3677910a12.0
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 05:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699708; cv=none;
        d=google.com; s=arc-20260327;
        b=DdyQmuQEJ4Ua67qcsCmx6w2ldUhOkeDD44+l5n/cpXliHI34LoD1dqeZ7TTSbo2LfX
         RTyZ8fcTr3mcSaE6hMtiq1mBEJLs9eTZnyq23wqYGtkKghxR5IHV621fLlcaG4OACXw/
         iP7TTnFpULw2G+Ju6i74kCFgrxZQ3aj0V/mWdxg3HHWUp9eG/0NXSp8vWI3WMrjpCfYQ
         Ef5en2FSYEX5yLqUKbbCy3Vc39c+cGh9NjyVjn4JCFA3uWKayZW69nNmwLXknfRfR2s9
         gq8wKPgblzTOhg1oJMe8FG3bjc+95URyyhDKrx6IDzHhke3jnSTvLWEZgTRJVMEZp8cF
         3AGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1+I6fHMDuPRbKnrDXPojoIz2V9mnQ+E25HZfyDXGVP8=;
        fh=FFDsqGIfgs0x0ubp6Hlw2KWORxsKiOp4X7nn1hmHavI=;
        b=MNJ7zdxeai6/nic0IsjXzzV7zDUouYe6lfhtm6BnMphbTvDm1hqMNkaGtg3alNxebl
         xolIW2WJAKXWaESF0OECO6gKAUr3XKZeWA0rY/G8NVMQDn2ZtbVcsqDOKA8HJar/IAYi
         hVJGOSel9hr93hcNEVYX7FZ3ZnFOHw21aBVbbULXZ6brPaxTIg4S7eEUnwYKXdxQrT7u
         DViRPpxpkDvRJtvBDQlvAQ9ql33ozt9XsQUNr/WV1OSSOpFzVLXqNOGxSDeza3pPC1UX
         drwuk7Xa/kG5ghiDpMlFoXU/m725iKKpWi9GSb6wNS7vYt/Yk6rSV4V3rMgU68mIoz3K
         yHsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699708; x=1796304508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+I6fHMDuPRbKnrDXPojoIz2V9mnQ+E25HZfyDXGVP8=;
        b=JX+sn8LTZKuft2DrkTd+yPATFraOHfohiq68RBiaNMvU6087bU+jheqJOFnDIDp4C2
         Hz+nU0/CZpWJMxopgv9oane83Tv/yMtJkpHySpm9yZBNJ1H102pw8k0S6zFdW+ubE9dm
         lkpKl48lxKvtAJGLz4RGlzyIObfaM7/yDElTDtS0/maU2vOfao8JE9kBij3TtHynRqxI
         a7TdNHufp1FoXBSwhBNVEmbjrNTAmq05XAURw5XARaPfDSo/C1GuRdtEpl8AfUPACV16
         0X5/vkT0LgUWAqYkGsmhjtuQqXQM2pv6mpprY4gl76eySodL3VU2YtSJ4DuE+h3NQTKa
         7kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699708; x=1796304508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+I6fHMDuPRbKnrDXPojoIz2V9mnQ+E25HZfyDXGVP8=;
        b=S4GMy3fY4kuoYlxX9y/RYiwR+/7zLjI0OZp/qphDarYpmfc4aFpqRiZmOil999rI4A
         MUtuGol9y7yw+w01cFsxaKaV3ep2W2r/DBYDjdiurU1kIYyPsDVrWDdOb96xrVQzjV1B
         lJSObjHeWxOT7Tjm4ov3MabJsgtpXJ0YhEuTCBB2teZurZLZPTaCqfKsjCV3XggI25sy
         Hs3EYdTGJgK74HrinI7+OEz+zOp0EKGaVsMWlXbHlyTvCepznSsT3eoiug7s8/YcdKYW
         WQAWIKPaDMMoWcqP6/mHkGQLW46RkNmUXOUj5Hr7/Gkx5tWQYf79qECGKbgX3g9VwQzi
         h0CA==
X-Forwarded-Encrypted: i=1; AL+hErGC9TFYFPJufgew7AFFyYpuoyzQqGAaQeBIARF1lKtkCl/EjjIIl5MSgSn7ZMbBZlhtQqNY41NtOuZMIg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+un+VZtI/FRPaSeETDCUm7rRAE1zUwzOGIZG8k+9LF80pZFndh
	C4CZKTyFa3uobQC7QtHo5FZBM9a1xrJpOgkABsSusLeIPWVmLxTFgD1kDnRnFftKF2CmIojt50H
	+IpgCgwSAOHgjwnUr+tazwmEboY9FIQkcIHLLyOg82FuAhpYqHYPt/q16IqYM1mgnQM0WPx0EEy
	dzJOF3vb3OdX6xq5Czg5aYvVwXQluqG+1uOXV/ycDO
X-Gm-Gg: AZFdTZcyPwNopzkJpJC7ao2bx2rb/BGkcqfz+b+5liNvKWTvJQOHi01qPEG7Hk/gSHB
	DC/EvZ4n6nlD8p2Tvsf2mpTcDRNmvsY4/4JneypmQWQKPJbXrTbgMltCQwq7wt770TyJgJNgb2Z
	LEdxZWRTcs2gDTkLPF0RpnvnrlXIAEqxb0w1Ec1sWrMbfehTzhoHA59/Hm7Q==
X-Received: by 2002:a17:90b:4e8c:b0:3b0:99f8:72f4 with SMTP id 98e67ed59e1d1-3b40a5ddc20mr17103191a91.23.1795699707516;
        Thu, 26 Nov 2026 05:28:27 -0800 (PST)
X-Received: by 2002:a17:90b:4e8c:b0:3b0:99f8:72f4 with SMTP id
 98e67ed59e1d1-3b40a5ddc20mr17103161a91.23.1795699706928; Thu, 26 Nov 2026
 05:28:26 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <4779892.LvFx2qVVIh@rafael.j.wysocki> <CAPx+jO8d-25kLQw9X0wW4i3YV4Jn+2Zr7_ZOT9rE10D99kPU_Q@mail.gmail.com>
 <CAJZ5v0j5M7fax8_XP1G4oENykq6vg-hgiW4JPaqf=AvRiY-xFA@mail.gmail.com>
In-Reply-To: <CAJZ5v0j5M7fax8_XP1G4oENykq6vg-hgiW4JPaqf=AvRiY-xFA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:28:15 +0100
X-Gm-Features: Aa3M54osf1Ltqb35tf2iD0aVrSfLOXZ5vwQSyn4Tud5SI8CTusSvx9qN5agwOyw
Message-ID: <CAPx+jO--Nzeh+vv0g_sZXxXehLU1hv-O1MbA_wsRj5oHUZK7aA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PM: runtime: Fix issues related to autosuspend
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GxWUX5TqknGajRQz6VmE8qM4AXC1Ok_d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX2zIjXpmfg89V
 TeBOVaWJ18+pROddsPR+VYFc0TPMPnR3J8D865G1vOy7f+QmThJfYgWLBz1VDfTulq6zjHAwyCZ
 DmG89c58ETozXISlJqwCdr0nu4cHzso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX0EKvSudW2iAh
 0XEAvVsPteMS+bVP1vF8OYY6ZuBaz6xMmYuuBF16mRo4NYR6cdnCSOx9Q1qRovnPk+IbH4gK5Ou
 huRrjAXcbrGhSdOc7cssoRH3EeaPbw25tffo71AH/6dSZc4a2xdC1xfYbr1ZdcUgK8UUf0AZua8
 71UspnanF8k38T7JT5WCD0XIy+RTfxca2s490Fu9LM0IrXX4wCkOD8gzMhpa0gHAijIkuPryu7L
 EJvWlYOsjPNdGbaOP0esqnrSN4ydhkQLnyJH3ImPdx5gYJ8NHsjKIiqpuj8hcGVw+9RzZSfLCaU
 JmYqEQ8D03Kfst+qA6iALzBw6gQP9dyprqItY+AlaxeKeQlhTajpDP79LXJpoVOop7fq/yAuoFw
 oV5VJuFuUlJlMw2R0dJ/naQKYX/PQ4xB0GrQviUIrM1vVWq4/WVArykzFAvr8r/8RVBuIQLGiKw
 2gyDSOuyZaCDa/ZR66A==
X-Proofpoint-ORIG-GUID: GxWUX5TqknGajRQz6VmE8qM4AXC1Ok_d
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0833fc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SvWRspn6cuzICisoxksA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Thu, Nov 26, 2026 at 1:51=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Thu, Nov 26, 2026 at 12:51=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > On Tue, Nov 24, 2026 at 4:40=E2=80=AFPM Rafael J. Wysocki <rafael@kerne=
l.org> wrote:
> > >
> > > Hi All,
> > >
> > > This is a follow-up series for
> > >
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it/commit/?h=3Dlinux-next&id=3D26236a3e8803f7e1ace104020d7f006edb220116
> > >
> > > which is in linux-next and it replaces
> > >
> > > https://lore.kernel.org/linux-pm/3076901.e9J7NaK4W3@rafael.j.wysocki/
> > >
> > > (hence v2).
> > >
> > > First of all, there is a potential issue with respecting autosuspend =
delays
> > > in pm_runtime_put_autosuspend() and pm_runtime_put_sync_autosuspend()=
 that
> > > existed before the above commit, which is addressed in the first patc=
h,
> > > and that fix is relevant for the other patches in the series.
> > >
> > > Second, the commit above overlooked some cases in which a running aut=
osuspend
> > > timer may trigger between dropping a runtime PM reference to a device=
 and
> > > updating its last_busy timestamp, which may cause the device to suspe=
nd
> > > without respecting its autosuspend delay.  Those cases are addressed =
by
> > > the second patch.
> > >
> > > Next, I was mistaken when I wrote this in the changelog of the above =
commit:
> > >
> > >  Updating the last_busy timestamp when rpm_idle() returns an error
> > >  without calling rpm_suspend() is not useful because the device is th=
en
> > >  going to remain active for an unknown amount of time and its autosus=
pend
> > >  delay needs to take effect later.
> > >
> > > There actually is a reason for doing this which is that an autosuspen=
d timer
> > > (left behind by an intermediate runtime resume) may be running when r=
pm_idle()
> > > runs and that autosuspend timer needs to be prevented from using a so=
on-to-be-stale
> > > last_busy timestamp value.  That is addressed by the 3rd patch.
> > >
> > > Finally, the last patch updates a kerneldoc comment that has become o=
utdated after
> > > the commit above.
> > >
> > > For details, please see the patch changelogs.
> > >
> > > Thanks!
> > >
> > >
> > >
> >
> > Again, thanks for working on this! For the series, please add:
> >
> > Reviewed-by: Ulf Hansson <ulfh@kernel.org>
>
> Thank you!
>
> > As somewhat also proven by the subject $series, there are some churns
> > that we need to deal with in regards to the intermediate rpm_idle()
> > phase. I am wondering if it perhaps may be the time to consider
> > removing it altogether, unless we still think it's useful of course.
>
> I don't think that the rpm_idle() phase is super-useful.
>
> Of course, eliminating it would require getting rid of the runtime
> idle callbacks in the first place, but we all seem to agree that this
> should be doable and probably worth doing.

Okay, agreed!

>
> > In the past we have discussed introducing support for *multiple* (a
> > dynamical amount based on what the device supports) low power states
> > to runtime PM. When I started looking into how to implement it, I
> > stumbled over the rpm_idle() thing, which kind of prevented me from
> > moving forward at that point.
> >
> > What do you think?
>
> Here I have some doubts.
>
> I'm not sure if there is a single model covering multiple idle states
> that can be applied to every device in every system.
>
> There are different semantics and different requirements.  For
> example, you may consider "clock gate" and "power gate" states for
> some devices, such that a device needs to go to "clock gate" first and
> then to "power gate".  On the way back, it would need to go to "clock
> gate" before reaching full power.  However, this is not how PCI or
> ACPI PM works: There you can go from shallower to deeper, but to go
> the other way around you need to transition straight to full power.

I fully agree and honestly it's been a while since I thought about this.

In principle we would need something that is flexible enough to allow
us to support all the different devices and use cases. It's not a
straightforward thing, but removing rpm_idle() is probably going to
make it a bit easier, I think.

Kind regards
Uffe
