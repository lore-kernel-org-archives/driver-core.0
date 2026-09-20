Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696E23D3D11
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929254; cv=pass; b=AKEIkKMA+FjwmTt6gr5IMGvoOEHlnsaMZKrfhK1m5qiktFaJ5w9W54bJcrXTEJ8yWSzpLvHpimjYYFc4IjzTcz74vlmCaSGMbzpPDymQBmEpKSo1WdRvMcgpCXarfM1t3cJn/f4TMwgkfEgvs/AfbXMf5Bajkaq/ALClcjBDatc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929254; c=relaxed/simple;
	bh=SQV2oiqKeznGQCDrUMB6LypdK9wv6yvcWGpy0dftZ94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpwmSRfh+SS7FcA+71gkkjbYe6DhXAeFKpeYbw9jANJpF2M99F5t5/KGZPUCivxZTplibCTq54vsF5malzgWI7sJTb0H8Knuztibr/laJqASf6dAs8kvjltPDx43HCBTQoJ7afdxM3P+OZ605vZSkmd20xeEB882KjGc1Zop9Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=FsQgMw6d; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="FsQgMw6d"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so14249917b3.3
        for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 11:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789929252; cv=none;
        d=google.com; s=arc-20260327;
        b=kRyry5umiDvofZ7bmRLk/hVKh1OcfnKr/ZOKtm1hRSZqr+vIwPnzZ1Fw+JKKdRKjKS
         wB4qR3dOwn7sa+eSQyx8O2KH8Wh70ibOho57dvsAvAZMiDkRyqr6tjkWomBbOXJFcYh3
         nWu/l2e1QCv15a6pbrKXq9JxYBwSNU6ZtYpuu3sk/3YictwJtlvVxsFRWqy6Qk4e5yR0
         FGXjLxdGinBz7SjvoHuef9uC9jcKvXsEI7Y61im4p0S6+A7vQZ3iUxwWvog3jxqMs9f+
         31SnYvGEJ7eB1bzo0+HQQpTQ4nq1/D7zg2PhITDQzPfwqL90AuDXqqQAkY2G8SlqDKuP
         ctog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        fh=FsPMeJDaP0m61QG1O+yvWfUEJjIvwYZTqs2uEIWx3o8=;
        b=ojOeCbeNq53PfMxe3pwYRWv9xLIetoWpSN3AtRfCpC73wGI3COEXd/oXADhtIHPhGl
         MFLte0EX8ea6WrdM0xIy/afOKhHNWtD7XHxk5sEsZu5JHY1UG9G30PbsiHnlpHBHbHwk
         EsRE6PLEO29PO6s31OL4ctEWizlPfI6qhUFhP6zfa+vD/un6zemEdmCGikRtxXmqCD0x
         5rgHooQFq3pf2G1iWXISWFNrpiItbz32pcdscHw3Mh4xA52vwCqTWZMXUQVwNskQc/tp
         I44Ap28NvTVq0J26myDzZ4wiQ9ES2io4/XdPuPOFfouHZGX98v6Ai/tYlYZk81EnhKOV
         1t+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789929252; x=1790534052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=FsQgMw6dy5EINuXXe1ngllYqLe53kldB6CxEi2FSkSh55iDuZ8vwRcaS99EbuaWA3Y
         5mUyj9oQbWasCJlg1yocGOfqnzxX5I5li3URnDh36nvDtIKc6+UnUWaLp196T3wBDBxO
         QTvjSJ0PCYJef7QnLpj6K4q/KYKXwH5oBal61jsotWiyX7j/DPFDg/4DwgWiIAvaicqp
         cem6VD9593CwPARjgMOb4Kmwc3/SFKwbioJP85TjwBMiTRr0qQ9uA2SIioEGr4YhOZm/
         Z6HAGCqPn5Y6qJvmUQuQ+ohIGAO7UJqO3kOLtwJKJ6fwuGrWGybVq+F0RfoF40KFmyx8
         gy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929252; x=1790534052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=oK1VSYQDDRZrB4qatYNoaKNzKxVBthwjbz1Dvek6JH6mVgUWs6C3QTePQhessSPc49
         Fy145mnMprx8U6oKnJB17QGXHT8CvboEZG+Sl33ADU0KsJAhAV378ynqVpGWwjhAVG8O
         vgC0wYBFpdl8ifNqsmJIwC20RdMNVHklLDEmQW6PFz+LjuQntcD89tnyIzJoWdEh4URz
         La6huho0a7a7R2AcWrrMP9U+o0SjyUw6bG6iZ6KSVC5ptlAR5K1p+ZSKTCK1g9ae9oMZ
         c2t6AiYi6mrKlbHLvy7P3vKO55Inb4lcAM/8SzivNu4JV20Cete8hJCEIis8X0IbnO7W
         ge2A==
X-Forwarded-Encrypted: i=1; AKwUvBw7pO5XRFn0qoOxCHqp92UpCFayKazpm+4URZhQTJTf37Q4Jp/45nfMyhmO+6s4PO5flk5HH079WyneVQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mXkMCml+MegfPGnE2W40oLg6WOcTWZtryPIybX936cwFrXS9jQ
	Sr53Pjg+F30KbN4+eWj8gz+Z/DCMUMFYdCfN7q7+0uXnJjDlvp1EOFvu/9xp41Ktu5TgBeP5QOA
	LcHN9Y9/koC37Ec7QSzbCR04V39Zxf9/X2V9SXcqdpC4=
X-Gm-Gg: AYBFou1hyI84bDstSELAxewgSKvoFnbDqqL08bx07DZuLlILpw18kFBsC6O6za5HtU/
	sEHTZ9WnKBXGeQi9hQFFfJrlYEFxcgdhiWPDbXFjJ6bp1QIpj983vQlbaguQknFCOo44Fpw1Exy
	S0BDux1/OO1dh/Z8LWebzDcVArbon2jBplASAZvQRByCRJXf+StyxcZRsCppmnDx0fT5AN31p2w
	vU7lCS2YvMWV5ZZNTTlN5pP6pCsAGHOMmPma09coQ98rQemxJmC97jya/JD+A1iW7O5wTmT0icb
	oXVrEmmQrXfYY4F+sMlQd7xHXzLLtxyKCAUOuQGIekdki0l778qxnVa9Rm1IhIVSTbdQ79RFStH
	Jvc84RMvE5G3ZW8b1U9jSvy9/KDvPZUTmXMrFxHWMb609kD9SjNqNsnHr92Ng5UU//aFrxbZnzk
	nCgHgjNsvus4hO0IolWjqB9o+1
X-Received: by 2002:a05:690c:e24b:20b0:873:5bd1:98b6 with SMTP id
 00721157ae682-89736b37e64mr15478617b3.40.1789929252348; Sun, 20 Sep 2026
 11:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
 <aq6gJTYTpTr8sYPj@cashel.logfs.org> <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
 <aq6sd2Z3nZuAYbMG@cashel.logfs.org> <87cxu8axvh.fsf@bootlin.com> <arAHq0imD-Gm_bOc@cashel.logfs.org>
In-Reply-To: <arAHq0imD-Gm_bOc@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 00:04:00 +0530
X-Gm-Features: AcwNN1XxQ2tTnCe51T1q51ULBvx85COBmsrgwZB0hguL-K1VAzqspcbd4FKQXzI
Message-ID: <CAE2Bdm2TpoA9ctHGhvtrDePvz11Yf3koyiw9S4WvY0jS5jZSuQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	vigneshr@ti.com, Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz set subsystems: mtd


Regards,
- Chris

"But how could you live and have no story to tell?"

On Sun, 20 Sept 2026 at 21:50, J=C3=B6rn Engel <joern@barelysecure.org> wro=
te:
>
> Hello Miqu=C3=A8l
>
> On Sun, Sep 20, 2026 at 02:52:18PM +0200, Miquel Raynal wrote:
> >
> > Not saying this would be a bad move, it would be highly inconsistent
> > with the current code base. Every single allocation in the kernel is
> > checked. Such a change, without a documented and agreed upon method,
> > would lead to dozens fuzzing AIs sending patches to add the "missing"
> > check.
>
> If your argument is that such a change would be inappropriate for the
> patch in question, I totally agree with you.
>
> I would disagree with an argument of "we should do the wrong thing for
> the sake of consistency".  If indeed it is the wrong thing, we should
> stop doing it.  Then we can regain consistency by not doing the wrong
> thing anywhere.  In other words, consistency is irrelevant.  The only
> question should be whether such a change is right or wrong.
>
> There is also the practical consideration that changing the kmalloc
> interface will lead to thousands of changes throughout the kernel and
> requires a large time commitment from someone.  If nobody volunteers to
> be that someone, it might still be better to stick with the status quo
> for now.
>
>
> So making an entirely theoretical "if I were king for a day" kind of
> argument, I don't think GFP_KERNEL allocations should have to check for
> failure.  Neither should userspace callers to malloc.  An interface that
> frequently returns errors is pretty safe, as callers with broken error
> handling are quickly detected and fixes.  An interface that almost never
> returns errors is dangerous, as broken error handling in callers becomes
> common and will eventually lead to bizarre hard-to-reproduce failures.
>
> One of my roles in my last job was to fix userspace malloc and one of my
> fixes was to ensure it would never return an allocation failure.  If it
> returned, the caller received what it requested.  If that wasn't
> possible, the process would crash.  A crashing process isn't exactly
> desired, but it beats unpredictable behavior triggered by broken error
> handlers.  And dealing with a single error path costs significantly less
> cognitive effort than dealing with thousands of error handlers
> everywhere in the code base.
>
> Anyway, since I am not volunteering to spend a significant chunk of my
> time, this is just the opinion of someone that doesn't matter.  Feel
> free to reject it.
>
> J=C3=B6rn
>
> --
> Why do musicians compose symphonies and poets write poems?
> They do it because life wouldn't have any meaning for them if they didn't=
.
> That's why I draw cartoons.  It's my life.
> -- Charles Shultz
