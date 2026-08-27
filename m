Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A23DD50D
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821903; cv=pass; b=XTt6SFZ2xWmj84dO6D6OYD1DxVYE9ryCJhfdsQG2UHxo6nbstKwtFC5as9XRQzhfmwHzxoNePg7vWV2vw03lDzjV+Vq8BqAfl0DoTtWzDpgKYKVoMZIEO/2MvI1djUPS9Dlu5mFvC9nTNt7hAjJrnFgHROj1e/r22MZoUWQWTpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821903; c=relaxed/simple;
	bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEaQfhXdrQOXw8AASOtU7R2P54j48OflVHiafR18bP7ueDsD+gCuE9ewyLMJ30AjbqT5Do5aJVea2wEO2ZRTlf2mQiBPzgEAfCXrdc88UJGHhtWH+QpsGBgTjy0r3ET1jFgp7QUpvlezIqbF3QYXPgHs5g84iuBT0CTBjsBk28o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCjb1XHc; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCjb1XHc"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52de178a66aso13677491cf.3
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 02:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821900; cv=none;
        d=google.com; s=arc-20260327;
        b=pQTV7nhLn2vFt7BJpokyn7s/9ySb/4agJka2hX5b9lwUv4BI1IBb/ksftFoLla8rDN
         cnqodt65aMwpvedfFsvb19I0r4Qb48qyVn4ASnL6LjHB0Uq0rdunABaSSMYYsEq+Icd5
         cdOnD9Uky8FooygRq7XNYfkchuaqYaZhPmFo8fOBVmnT3XhLrfyd+e/+dZphCahpKREG
         mjp3qbHrVx3V0Bz9x6CT9St2HzPMjfisTYNby8/xUkYxQz09JlqgJplFVaW4JFMsYtxg
         PDZQJUewy5ipXXY4aCxtXLgKCloYlVZ1QMmhM5ftOFT2XK2yHXd+FraFVNNhLgnlIwgu
         xR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        fh=yz1mmAt/wZtOVUPjfYXzr4svtY6RfOYBQPjmmBSB8mk=;
        b=nplk1ZWJR9dPDIXfgBrVAiQwonYgX8uWAu+91J7nMMR6O4J/Qen5+YhsdlHHA0uBXq
         iI/oPsgIK8D7p6SV+VbjhPnkOl3+ilyJLIMLszg7BuvRYDqtMnlOUhpfOWfEFPuosKKg
         kADgd98EcS5XYhrQ3vjlBPpRCqPcM3wjMGh1nSWWJMVlhlNfW5kn1eTVBl5YZB9pJZ48
         VLI9yg10myRmhK81laFTKwL2bFC6lEbIsmsre1CTcpJPOAhhaddUmIH/GVKcO+OoerR7
         GhkHzkdP3FJUUZNDHAB/+hGl+Rhkz7ep7+g/3F0Fumq3EHHyx4klC2Va1pzDulNvqnO7
         s04Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821900; x=1788426700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=JCjb1XHctGAG5iIEZjIY32Sz7dWl0sPtIs2Jkh6UcrthFTVFI4lM2c4jqtuny48SrN
         ukuebnlUdEw0zHfk3s3jbTLytkFnK/0iVdSDppkELC0TsJ0W+KHwuh0lushuorlJYWnJ
         Qk+QbDh2/vq3VouIFzto0be+8j2hswQCCsy/jkDs1eE3LlHmxWooL+9zX4QMsuBKdRh/
         C4Y81nV0Bczqq0UhfbQtDhVSjp9IF/G7WpZgxtnzpiMNblLiB9yd8Ot6XJWwutbBGAzh
         D0FSS7x2VJs+2IOaMlirRSS4BlQrrsWzymQMhLT4k3619QJIGAgt40wrhehMl0XPJiOD
         2rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821900; x=1788426700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5A5U1mywmc0grhiTqrdHhJFn841cGWgqTfm0zuSxEDs=;
        b=kQc0bbHygkpNLVZNfjiUfjdZ5k+AwwiW4/UhIx1U//EJMmUPP5EFhKQ61lNc4841d9
         sjMSEe+rPcHqtUtWtxw8s0tTOolAbaYGJVkiGx7qPx3Q5KCR4cEKrmFGNiDuR3+xjps2
         P0JzHtX64uN6/KIegN852Oyx3YA6Ou+dqPJukjHIUG0rU2Ztm2qoOTCbsTx6QlK7e3Qj
         JuiuqZcy2MTexnbQ7pYF2LXeERdu1Yrw5+Zs19pHZN2S6Rh6UpLf+KPaC9DVBW3vbVoJ
         AvWeL39fY3kMDos84Ig4XkBH/hqxiNPubUmHt+Z8esglHU/fyCdck7svMvmxxUAqPUuL
         dkgg==
X-Forwarded-Encrypted: i=1; AHgh+RoILqb27ixhri1zHAqz5fDWYf5PfqqcIKRmuc3zvt1O/+i0xtJImLm87S5wOoZaSADyoVQlQYIRRZkq/Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mRMRUNVj47TBXAAgpLj2Q4b285NKmPgT353XfpekV0xgyTELPF
	mNF2nKWTX9d9um04P9kX+g40OSqG2n8+E8nGhe7NAP2dLV9UAfbSYAMgORvU9oYv45AGCtse2dW
	l4VQMNfx0K1heZxKlHgIr0Jn/90ebRuU=
X-Gm-Gg: AR+sD12XOt6iWZnjlqzAG5crHb/jwqYVPA++m05jze34RPkZouyI9GAk8948+Iv5Z39
	XB+5CDXMCXHx1k3cLRKiwlPQDqob6d9U05ZWUaw628Q7iNYXGyNbceZchkLaorsi44zGhDP3rWs
	xGbwPvAtcDrhrxEGwFTM4Xba0DaTtFgRLlWZqO3DONMvsD2qLxC8NLymQcYpbZkCnnnB/2i89D6
	1JKjf0I5JBYbqntqGnbYwrC/FJdSq+BVk9eSXINJ9HMzxXpqvPUWamKL6fE6QLEsWw+2H5kYfJa
	DCxsvkvPm0a3w1/FI4EOeOnalFHU3Urk5pDALC4gluSDATgUKeFcFic7
X-Received: by 2002:a05:622a:5a19:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52e42344bd3mr160664931cf.26.1787821899586; Thu, 27 Aug 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811072830.10028-1-seanwang1@lenovo.com> <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com> <aoX_jiuhv3dyMS-g@arm.com> <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
 <ao_9EiKz9Cmx_YHh@arm.com>
In-Reply-To: <ao_9EiKz9Cmx_YHh@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 27 Aug 2026 17:11:28 +0800
X-Gm-Features: AcwNN1WMellCGNam0VYOTagPOg-9X9_IhSGS0spY85eL_CK-6sC-A-EA_adMUno
Message-ID: <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
To: Beata Michalska <beata.michalska@arm.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:02=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Mon, Aug 24, 2026 at 05:21:03PM +0800, Xuewen Yan wrote:
> > On Thu, Aug 20, 2026 at 3:11=E2=80=AFAM Beata Michalska <beata.michalsk=
a@arm.com> wrote:
> > >
> > Should we distinguish between events?
> We could although for this particular issue clearing the source is the on=
e that
> needs attention. But I do not see why we could not have both.
> This was just sharing the idea, not a final patch.
> >
> > > ---
> > >
> > > This is just a rough idea, and needs ironing out the wrinkles, which =
are there,
> > > but that allows leaving the idle enter as is. I also believe this is =
the right
> > > approach for the interface itself, although I also see some drawbacks=
 and
> > > potential issues (in its current state), especially that the function=
ality is
> > > being exposed to modules.
> > > Nevertheless, those are my two cents, untested, just sketched.
> >
> > As an aside, could we verify the functionality of the AMU's
> > SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
> > To my knowledge, many chips currently have inaccurate errata in this co=
unter.
> > Alternatively, could we introduce a command line that allows users to
> > dynamically disable this feature?
> >
> > Thanks!
> Do you have any particular issue in mind ?
> So far, from what I have been able to track, the issues reported are eith=
er
> handled by existing erratum or by the latest change that reads the counte=
rs in
> 'one go'. Can you share the details of the issue you are facing ?
> That would be helpful in potentially finding the right solution.

For example:
There is an A725 errata:
[A725]The CNT_CYCLES event can have a significant increment error due to WF=
E/WFI
Status
Fault type: Programmer Category B
Fault status: Present in r0p0, r0p1, and r0p2. Open.
......
Workaround
There is no workaround.

Thanks!
>
> ---
> BR
> Beata
>
