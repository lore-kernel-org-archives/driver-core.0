Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA875B1EB
	for <driver-core@lists.linux.dev>; Sun, 12 Apr 2026 22:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776034152; cv=pass; b=S0TjTUkUKMPTeEVZ9N5iro4RemSXv2camhxS693vXwkZgi2UfzxeQkD9r7s44iNSlQZJUJULduUqU+UkNaeP2TypRuiLnbNNz2shx4If7uCfHu4pZPDndk5u9nuaFw+FJiXudv+GjN1MQleZEXW1a92CMNX9QrjzphHkMArTdXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776034152; c=relaxed/simple;
	bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsWbO0eu0eA6goe6Ul8aO/7TnGnG29qK4wy00lpRWLviZJWcugqIsuRTaLEobotNjV9bAisynyxqPMxYxIXtD7s2sj4h61YEP2/YKBiDmNhjEr/Vi4PTSRpRU5Z91TmUuAlLrEKWEpTxz10ExfB6DM8omUUl0ExnB8Ag2eb2VyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDr4evVY; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDr4evVY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so61415795e9.2
        for <driver-core@lists.linux.dev>; Sun, 12 Apr 2026 15:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776034149; cv=none;
        d=google.com; s=arc-20240605;
        b=JwJyNzFEx8vLbcBB+y8xsfQmDJGHINHYBiGrRgUZ/AWNJ42O2lk6dYBqu8r0FcJH/k
         FPbagHayvcGizNY8RU+mRwRz0zs8/tykmYMEV5tPkxnMLsOQ9oCtD9gJYbrNdWyo0F0w
         +ZIcweIqdhIVLgoO3gumRAXzDRPyfc2NE2DmNobrrR7Pp08F76nUzDlZp0mDKgDzepWi
         u96NwoKgEgz3Y/k0Y7IqI4jwdPqC2b1jUvImR7B2pupapeMKmmLiOebI/qknaaPfVbOz
         ayaFHbTRxJDOaebXCd4exVi4f2UGFIYjcVNFC7+DY5abY1TvgCPST08rRHQiE+N9y/kI
         laXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        fh=QfVLjs6uK+z0m0rrFeagTGbNOaAMRNabmYktXl/wwKg=;
        b=ZoY4i+mlY3mvPWDrVsX2LSZmdQp17UaxllXuEGs8YXMYq7W+H5JmIGUisG/JEJ4tQs
         PyPgMV9I5Ojr3RahauDCAE5CLmeVNh9voTpDr5nv2RY/n4RIPdW2EERlbQizUDrc4N9R
         TOrp/S/tPs5G/n0k4Vg0PzE7CWpc0vPFZbBPggC0E2NhTA0nZzqaiizjOahyE6absibS
         SJiAOIQUpEbAJulx73oprVbOr/yzOX6PkoHVISNjmnyiLiTXOdCwTROt9DWCnrM5anJD
         I1cS7J9W2oB1382RWJUZCmlgh20rSPmig3O8QFrnOQRhHc0BZMaL6AmJGPft1mDSS8fV
         RfvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776034149; x=1776638949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        b=BDr4evVYHact0PySftOy/TfmA6+CM6l52pmf6tXznsYPHSzeIL/cRJFaNTPf0t8dXI
         5Bj6pIDMFPg2ZqwAG+oe1dhSUJvNZ0c9BHwWnL8nbyuzWybYbJEf61mZjrRR+loPDzuT
         La2Ik4pHczD7Q/+z0soQ4dWZb1zc9KnK6/ZLy8e7ZaGNfIXXjS7YaUoJhr+zq1643bk8
         7o3YNJZF48uDRv9solYQ8/ikeRhSBEgQC734Jfnk/Ei+pQs207ppKHTAqnB7AiWqzGwj
         K50CqXD5zT2Bo8W2em0o4jTpWtc8Q6ZVX1LwD5I4SDXMtREPqikCb6V+D/jqZpR/KBFB
         V7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776034149; x=1776638949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        b=oZ++pvtWYgD6ojMJjnFN7TdzcUuVxPKPO82UHomFG9J83qyRWiyFhHXvMSE9lHrNUG
         gZ5nM5gRwom9TYGyPv5n+VuS30An9WbuszoyHjUI0/qeIt6hAihE+Zlr8kMEDcpzOvGb
         +CLtwBilmq1ylgcZQWvz1QvnLQIz3x5ASJyJ30APpH4/VX1KDWmemws3YQb1G3dj8OyP
         j+Ryoi/NJQQ9IaA+D7gFl5Fj4jN/tCHUs36WX5K+vC8UovLnuBxR5Qy+XVXWeMiaAYMe
         pOACnQbF2sfCUsS8NDERBy375YWK0NDK9GH8LySvJTK5QFaXQm38SvUYGdPXI/XYou6h
         DbkA==
X-Forwarded-Encrypted: i=1; AJvYcCUWj7OX0NDwN1TPVKD5e9b6K32Rb7dbxYb2MFQKXPSL7bLCbE5yZGkQb+FpF5qug+/acID+nm2GR9l0Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSrC+HVftM/CjEWcDyVplGel9ezm6wLeaIk5BfgGCGuiDJIuDv
	r1Cm+1c+Ab3u3wKOx59RJSiDY6Sr341xQFmLAsicyMxgDVIapaWdnzHAcLwq3p+OqBuZc1vF0/S
	aRavmIyjJHQaXWGngxInInhalHlSR5xs=
X-Gm-Gg: AeBDiesWpDRkbt9kzLN5glZogEsYg9BfpFncL5lbut270bLlEc8O8JmkvCGrqEnnIlP
	EVhi5/qVG+DJODE3uDMs2jVgzPyPWcPgaDBkDte3UUjB6g6ZqiThiJB246/l6H1lgRVE5xJDu9k
	lULxoyXcwz1zK+NSsP9Btrl1OH6nHzkWUmhdMrHCRz7bZck+PrjfHG/AIrtrnawMge+EFBTzInc
	nB/7z60sZrmWcrQ0wzZWWOMzhsKPUB71nmY7OZulsnuAxdD15GFpCT3XyY1q7KSOyIiyvBs3Waz
	CL+4LZytoa339lZfpL/CHoV8rwksx7EWc+DBi6/TDHYr6WCbsT/7Ft/xTxIfSB0WEJ6Vt5s/8GO
	YWycT8Sf0yjRFJqeHS9zmRCZoxA==
X-Received: by 2002:a05:600c:6990:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-488d67f5bf5mr154924175e9.12.1776034149238; Sun, 12 Apr 2026
 15:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
 <2026040236-kiln-carat-bb6d@gregkh> <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
 <2026040357-undefined-gave-c98e@gregkh> <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
In-Reply-To: <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 12 Apr 2026 15:48:58 -0700
X-Gm-Features: AQROBzBmpL408c1tkfYuNTafpAd5aZMliRFfez61VTABAQ1oaYAiYAqJdTmdInY
Message-ID: <CAADnVQLELWyv0kuv8wK3FJVFdJPbp-tD8d3p2pgCiVrcw_cVNA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:28=E2=80=AFAM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Fri, Apr 3, 2026 at 3:04=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Apr 02, 2026 at 12:37:12PM -0700, Samuel Wu wrote:
> > > On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > > > > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
>
> [ ... ]
>
> > > The data is fundamental for debugging and improving power at scale.
> > > The original discussion and patch [1] provide more context of the
> > > intent. To summarize the history, debugfs was unstable and insecure,
> > > leading to the current sysfs implementation. However, sysfs has the
> > > constraint of one attribute per node, requiring 10 sysfs accesses per
> > > wakeup source.
> >
> > Ok, as the sysfs api doesn't work your use case anymore, why do we need
> > to keep it around at all?
> >
> > > That said, I completely agree that reading 1500+ sysfs files at once
> > > is unreasonable. Perhaps the sysfs approach was manageable at the tim=
e
> > > of [1], but moving forward we need a more scalable solution. This is
> > > the main motivator and makes BPF the sane approach, as it improves
> > > traversal in nearly every aspect (e.g. cycles, memory, simplicity,
> > > scalability).
> >
> > I'm all for making this more scalable and work for your systems now, bu=
t
> > consider if you could drop the sysfs api entirely, would you want this
> > to be a different type of api entirely instead of having to plug throug=
h
> > these using ebpf?
>
> Almost all use cases want all this data at once, so AFAICT BPF offers
> the best performance for that. But of course, open to discussion if
> there is an alternative API that matches BPF's performance for this
> use case.
>
> I'm not opposed to dropping the sysfs approach, and I attempted to do
> so in the v1 patch [1]. I'm not sure who else currently uses those
> sysfs nodes, but a config flag should remove friction and could be a
> stepping stone toward deprecation/removal.
>
> [1]: https://lore.kernel.org/all/20260320160055.4114055-3-wusamuel@google=
.com/

The patches make sense to me.

Patch 2 adds a bpf selftest and corresponding:
+CONFIG_DIBS_LO=3Dy
+CONFIG_PM_WAKELOCKS=3Dy

and almost green in BPF CI.

Except s390 that fails with:

Error: #682/1 wakeup_source/iterate_and_verify_times
Error: #682/1 wakeup_source/iterate_and_verify_times
libbpf: extern (func ksym) 'bpf_wakeup_sources_get_head': not found in
kernel or module BTFs
libbpf: failed to load BPF skeleton 'test_wakeup_source': -EINVAL
test_wakeup_source:FAIL:skel_open_and_load unexpected error: -22

We can still land it into bpf-next for this merge window.

Greg,
any objection ?

If not, Samuel, could you resend and address s390 issue?
I'm guessing wakeup sources just don't exist there.
