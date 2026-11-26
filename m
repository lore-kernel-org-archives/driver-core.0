Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683657;
	b=UNukeuAh1qzyShvfPUxVnBwGKeHLtz4tIpq7bp0KQ1beKpGBG5sFN4SrFJ2E/bIu9j7e
	 1hWiMUOGoqbuJ+PouVTdUrylb7RMkCMFXsf8bSk7nvII8GaTWy54GTffgZu+KpKQIN2YP
	 2OGZg77ganqfNEdB465YSd9dIIB0n7cUY7KTUgDiN3CInRG+g7gpFlL1v4zzlcBgYmM/O
	 47DTcY3TDKKmO5biVl+KM7kwE+zgYllAud+8WxE6j/qLRIyG6Mag+9+O+yjEJuQdyvTws
	 EQGBd7unAo+y64WNrRsAPP+EFp8zYYKceoNzkO9hjxXIysrZ3oimNYNwtP3/wLhjtHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683657;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
	b=r0nnEQCUqu4aJp9UjSWcbG9x/cm2Xa+IY6mq5X/+Z7c/JAgZ62UMrvOJ37sCxwvJ5sEc
	 6EIqdliZ4di9SLLTCAUU/UtK1GZFEqlRNU6fzz5VtUHnS5PAJdJUKF2YzwEphnCJgc5Lx
	 fFh7Nzfh40itcHPfMPsnlbVHLvTN71jiql0jryqIBY751//IBxwDyBZfS7pD+p4pbiJR2
	 Pl04Yvytm9SYHwjkBxMmELM/nvkKWry/uM/mkBMMvEW5gXNsN+7zri5gaEEXR4YyzAhnq
	 xspn7Cus6oXpC7Rt1+2HCGgjJCcpNncWvUU7kBKyzHTc4DbuD2qovROHNJQkYz21eXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DEF606A323
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53ec9237600so3130967b6e.3
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683656; x=1796288456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
        b=ycVoKIxOuXeYcYmebzDZoGwu2j6PHtTbNwAqKm0jVUJ307QolpL+l8ZpRPQDCxYnjv
         QnH9to7Ho1YbF6j+YX1vfdHCULPT+VMopOdkzhilkF9SQuWO3HdtEHJWuNMuqaQIcc4v
         jXV7OdH56uwLrQccQtMcuw0srfLxvLYqyIFqrUVXL75kh6ZWUEKD31nDLLihLZt6vh37
         hQxKebLdFH0u4cPOUR615cROP9CV9ojHd84eSA9bcgRZYbm8B4h3m1zf1Ov3xmB+Xm6+
         6pwJJU2W2VFA32EWi1QvpjTuqFifFZHQaj3Al6aGkV+9bjggi9C0lHpQjYX6j6iABoj6
         pHWw==
X-Forwarded-Encrypted: i=1; AL+hErEmiIPvLW1bCgrO3abp1Ntsckm0UyNEXHKvYf55d4XLlwyEmv1g4r4tKhfokBRANtkKdmqaTsUx3L79qw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+vbGbgtUfFBI0VlAG+MuVU4nTO9Pv/Uwi0H3ms0SKSxR0d0Yfy
	3ecgCA1W5HuHW20JxWswoYoFBFwyxwTlNyP6ZlF4Oj+Y49sDjfDdPE7GsQrVSyXe
X-Gm-Gg: AZFdTZevVFTlv7nmShrC/ANsCNCjeXebdeWOJRS5P06KKH8CkpgKYWuwFS/XubfvWyB
	BzCWz/cxN34aUFthDHVtk0l6mNg8BM+jUFqmyhYovsYaWuJm1dD/uxuKw1Tz7tsTRYV9cQ67NL1
	5FVEpGL8CbKWOKuSA0tiOxppjZs6uMobJBgDME5vxElb8ubnmyaWBSkgm8DQDUJQs42H/iHN1Bp
	6SzaysH7KA4ZLRxNhzNHQ4KHNnD81PJL/gY3rbYgfyBu98zWVd5tVdp7sI87Ge2/Dr947EQSoGe
	LBVWGT1ZGEB65goFguPo0SywlGFi2dd2xPguyLsqGn4fke65mR3LHrhVYv3FBAu3pWKFQ/CEF8p
	q3TzXTS97jiy8xE9WitPp/Z2jYUpqtdXa9rDyerdNVjWzcVkKWQYVlEFHPrwfJxo4Xa7Cj65Aqq
	bDLPoGTjb9j2/208BOYKUj235q6gZGVidksoVO9HAKZqV1icnAKDKm4Z9mYCav1kCds1YudDVm0
	HJCOkToG+O1CkclwOFSvrfD11418SoSLlQi8XUYtK387crh0QDHfYZlHLDFJT7VbrkY3SFtLfGZ
	P7pl3eEcRtJjDtQa8J5U63NXJWFcXX6IQvY8VfFNjaMtS5EGI5n/fQFssfo38SOG8aw=
X-Received: by 2002:a05:6808:c1ac:b0:573:680:4bc3 with SMTP id 5614622812f47-57a0c7cd6d0mr21248455b6e.58.1795683656387;
        Thu, 26 Nov 2026 01:00:56 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm16488907b6e.17.2026.11.26.01.00.55
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:00:56 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84a248254f4so4085698a34.0
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:00:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNPocZjYGwDMDVTc/bAR6FVZQcq68+EtEvKAdNkaNjJ+eRqcJFQPxUAVLsBErkbpLjcNRuRVGJLZ6fwg==@lists.linux.dev
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12178985e0c.8.1795683175291; Thu, 26 Nov 2026
 00:52:55 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795639368.git.alx@kernel.org> <396395e1d02ca080da67cfd91a1c49058b2676b6.1795639368.git.alx@kernel.org>
 <awdaYz9NNVv5fHv9@ashevche-desk.local> <awddHt_xvc-lIygA@devuan>
In-Reply-To: <awddHt_xvc-lIygA@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 09:52:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
X-Gm-Features: Aa3M54rOnub7bCh_NzEEm3acSwF_6HJABwfoziM7rtzTMFRTInpGyKc2wQ19vKo
Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] device property: Fix fwnode_name_eq() for empty
 node names
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Alejandro Colomar <alx@kernel.org>, 
	linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andreas Schwab <schwab@linux-m68k.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Wed, 25 Nov 2026 at 23:18, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:

> > Date: 2026-11-26 00:00:03+0200
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > On Wed, Nov 25, 2026 at 10:03:55PM +0100, Alejandro Colomar wrote:
> > > str_has_prefix() returns the prefix length on match and 0 on mismatch=
,
> > > so the mistmatch case can't be told from "empty prefix matched an emp=
ty
> > > string".
> > >
> > > For instance: the OF root node's name as returned by
> > > fwnode_get_name() is "" and will return 0 for any name matched agains=
t
> > > it and since len is 0 too, fwnode_name_eq() will return true.
> > >
> > > Let's use strprefix() instead, which also makes this function simpler=
.
> >
> > ...
> >
> > > Message-ID: <avrSUUM3HMgxTNpl@kekkonen.localdomain>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> >
> > What is this?
>
> git-am(1) has --message-id and the corresponding am.messageId, which
> stores the Message-ID from the email header field from which the patch
> is taken, to document where the patch was taken from.  It is stored by
> git-am(1) right below the last trailer tag from the patch (which should
> be the 'Signed-off-by' of the author), and before the 'Signed-off-by'
> appended by git-am(1) itself.
>
>         $ MANWIDTH=3D64 man git-am | grep -A5 messageId
>              am.messageId
>                  Add a Message-ID trailer based on the email header to
>                  the commit when using git=E2=80=90am(1) (see git=E2=80=
=90interpret=E2=80=90
>                  trailers(1)). See also the --message-id and
>                  --no-message-id options.
>
> It's useful to document where those tags come from, in case it's
> historically useful.
>
> I've extended its use to other tags I take from emails.
>
> > Is it documented tag nowadays?
>
> It is not documented in the kernel, AFAIK.  It is documented in
> git-am(1).  I included it, because I find it useful.  Feel free to drop
> it if it's not wanted (I can remove in in v8 if it's not wanted).

Please drop them, the tooling (b4) can find the origin regardless.

BTW, the kernel way to link to emails in commits is using Link:-tags, e.g.
Link: https://lore.kernel.org/avrSUUM3HMgxTNpl@kekkonen.localdomain

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
