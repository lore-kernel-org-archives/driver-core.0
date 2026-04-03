Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190A3C7E0C
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233720; cv=pass; b=ELnjIbRSr6QPYrSgQLS1qAxzLerlde4yI1gfSQhLNAAbotEHvXh2Nq0gXw8Sjz8YD0qgSoWNY6oq0debA15cAvg0ipVwF/lzGGPc9VsQu0ITL5hDO8OpC+Y55CavHUCm7boANsvKDalIl2NLrNrmy3OOWmTacErownByaeoEqcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233720; c=relaxed/simple;
	bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=On7eDc+7mzi6NKlPdyBU9DageYkCwjER4RitBfgcPnFXHIvrxqPMt/rlyiw1oDnxZKfinwTMqNJSvuV9Zwzj9fiWU0DhPmYrQfREmNzgw0dCD4aN1TM2g595bav2Lnh4RAflltrw25GKGHM2vGboPogdr+AmmqbcPWThgY6GxX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LdL8NHFL; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LdL8NHFL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c04152730so310997066b.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 09:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233710; cv=none;
        d=google.com; s=arc-20240605;
        b=eIrS0oNJNqH8QQl873/xale27dSIzpjn2KRcJOEOZkpqsq14/S0HJYuyxYgoQLHYzH
         pDpOkuXRlZl+INz0AY9dw+02CIoqtXUWrv+XZQOwJATPzdmaY7bbyPawInm74sor21x+
         B7gBv1FGVCMkk8o/Uuea2LjJPVCzXPN0aWszuorOcan01PBmzuTNgltetFcl68ShGWOO
         tv74agIDFMWVkOVtRsG1tpCEt0HFOnr+mbXej2JcHGKJrO65YzBHeliMMYqAC9r8xsJF
         W7Zzr4NMDVNzsmN3I2Zi+hXEBKnclXoXEeZtZi1JL4iC50/b9bmuBc9cNJMqTe+1lkGl
         Ceew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        fh=3DeYDobbdprlMjrd0b5AtfOKj7OSpX1osWbVIA6t8wQ=;
        b=HgnWDUhmA/eyv9hQ1VXpGSXrVtXHlHqxZ4S0sr/eLbEFsxxs7oudPOvlDF9+CcC40p
         rYaLmkPDm9DpAGbUkrs1qstS+gMbFsqvjp96HL0idc6pqZXZ21FUOWFayjQUdd3jyKxs
         Pkhc+rAwEkjHiEGlBxdb4SdImoe6Ryf4iiJmYUogKWfBtQpXSkaUPVy+oPEVWyMwq4Lk
         hNDvJ9RipALwLfZ6TgOMKfnGWS+UaYAFjnhxTQMWTPPNx6r6Z7dyt5BWTWSlmvieGpvX
         3dLOyI5w+gM8e5NEUzzqxl8TpNu15EN8voeUuM81r83xzSJ8pEfMtMZhgJeeJUTY9nFX
         bMwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775233710; x=1775838510; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        b=LdL8NHFL9n3+sING8flPp0NfOFVftgThdeIzzH8rZr3B4w1gBv3msqTED9SOyUARu0
         4LUZr8z8s5Qt2SJhm1kBmp+pj7v4TmfOeoCcMxWGTgPUdc08//5qHB65MbL8EQV8DK/G
         uQANWWAp2SNZVmACkvb62V2fBkqOlPSikT8x8vda4LNdRvX3D/5+uAFb3cGfHp4ScquY
         wrYGaD/zHdqhkRCXUr9uHtrw/wXlgynUIUsNzJt8P+k0yYOd7Fn7fku1XbjQ0+2vi5Z8
         svXh7J3iFl7K3KDgIpNqHBI0UN7rI0o3bNu7F3HnXDqkFEhNeTOGq0FI0gSxRyNCV6xt
         hGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233710; x=1775838510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        b=MxZvCK2kEAs0YRQZQDhdRAA7UZwEMXJ0xSaUTiRP8o04OVgCAiljAp196fvIi0c6NN
         FodB93w+W4uajxdxTV64yIfM4e0XHXcOwyMSHIHPua0BmwgoYyyae8XZF2yr9hlxo+Nk
         PDdsxZW5OPRPas2qr/bbZJNO7V735zTseR/yjTRiynVZ0jKt4zn5Yysg6Np6hN3Mqciq
         ZcxwA6zrTXOLd7zQH9cnrWXHCBLJyvPL79pPi+00CIz/IkTo6hlXaab17PlRwCcNal5s
         5U2EbBMZVOpF5nTGdsugNwXNCgp7EW21/f3tgMlIQJtt5JmdM0M3e6Fk0zaNlXlVupAu
         LCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfpqJ/h2lKFXhOgsi+l9bWDk+uaIWz9oiY56731usuGb7SpgLY5s+NOds+3rjkQ/wxA1v7ZilIm0+Wzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh8BwpGNVuyTCZ7rCmJ7TTP3/WCf/93AB4/wRJSF7YtKVyoYIN
	jw5clqR6uIO3n0xxIHzAdiCb+9uy6mkvFt6QMBQaxtxzSRp8fDk60VCpph40qqvkdtxORVnIO6D
	3wnOxDBXnq4gqCvd0jmmvZql/+jY6ZHtb9OOjVJbg
X-Gm-Gg: AeBDiesthfBTavH7hFCh0YjN+j8ru6KeOzzAnF7F5QiMTeXbdzdYBQN/P2clUP2MUtR
	f6Pz2SihlDepM9HCqxErIMLiDTQ6SH2y98e3sxZrpXJ4lNy5gi1H6cCqAVGW+9jlIVbVJ+dDWZU
	g3jCu0gMkGXb5JMxz6VrQId5t54qEQJbW4gztynowkBsB9NNXuK+1/J54zA7XP6Rclbmma7iF7v
	o3pc0ds5Oi+ffdvDBnXAewnn35e+jTb83p7K5eAsRHutXziMxjaBabIKsoNKl3a4yVWgUaFXPNF
	bvXKA9WwOV4Zs36tJu3SUMSVs+aelpHtLTzw5Eq3I/XCIPLMM4fv
X-Received: by 2002:a17:907:984:b0:b98:4f24:a6d with SMTP id
 a640c23a62f3a-b9c672d41acmr191528966b.11.1775233709065; Fri, 03 Apr 2026
 09:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
 <2026040236-kiln-carat-bb6d@gregkh> <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
 <2026040357-undefined-gave-c98e@gregkh>
In-Reply-To: <2026040357-undefined-gave-c98e@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 3 Apr 2026 09:28:16 -0700
X-Gm-Features: AQROBzBqCMHYMQgCewV6iBEDIM5gfYH7CX8XlpEk6-JJdgIOB-Bl687I7GX7WKY
Message-ID: <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:04=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 02, 2026 at 12:37:12PM -0700, Samuel Wu wrote:
> > On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > > > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:

[ ... ]

> > The data is fundamental for debugging and improving power at scale.
> > The original discussion and patch [1] provide more context of the
> > intent. To summarize the history, debugfs was unstable and insecure,
> > leading to the current sysfs implementation. However, sysfs has the
> > constraint of one attribute per node, requiring 10 sysfs accesses per
> > wakeup source.
>
> Ok, as the sysfs api doesn't work your use case anymore, why do we need
> to keep it around at all?
>
> > That said, I completely agree that reading 1500+ sysfs files at once
> > is unreasonable. Perhaps the sysfs approach was manageable at the time
> > of [1], but moving forward we need a more scalable solution. This is
> > the main motivator and makes BPF the sane approach, as it improves
> > traversal in nearly every aspect (e.g. cycles, memory, simplicity,
> > scalability).
>
> I'm all for making this more scalable and work for your systems now, but
> consider if you could drop the sysfs api entirely, would you want this
> to be a different type of api entirely instead of having to plug through
> these using ebpf?

Almost all use cases want all this data at once, so AFAICT BPF offers
the best performance for that. But of course, open to discussion if
there is an alternative API that matches BPF's performance for this
use case.

I'm not opposed to dropping the sysfs approach, and I attempted to do
so in the v1 patch [1]. I'm not sure who else currently uses those
sysfs nodes, but a config flag should remove friction and could be a
stepping stone toward deprecation/removal.

[1]: https://lore.kernel.org/all/20260320160055.4114055-3-wusamuel@google.c=
om/

Thanks!
-- Sam
