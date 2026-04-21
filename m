Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C82494FE
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776778241; cv=none; b=lDKA49GhbiN9TPhYFmXe1FavqTIvAh0W+H09YKC4sLpWusN7PRZ6tqjCJyMkteIwPBFmxziOoE8RDJKrhAaxUfMoCdDiAsMYst93/ff1wlDEQ6U61x9pn+SISr7d8HGaXidEIN3lWW5JyHiv9Co93hbpQU2o0j/8wT973JXY4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776778241; c=relaxed/simple;
	bh=FFUNLVgGj6TBwQDXczffhQbCSgIoRnXbz8CETIMk0U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYERb7GGf3JN2JPe+0BTGRAVipDJ5EXZdr0mVA7I+TbIQQSbAApeMdhuna4F6zOSlGih4vmJi5VOESjJOmYkVnZ5kVom2UMwjqfNh7kYKP+AjR5IqNLtK8AimaoS2S8lyQvafB6Yssh0ZYR7JCv8BM3efI6pjhDyawSyGhPZ3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXUxNhHg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXUxNhHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776778239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFUNLVgGj6TBwQDXczffhQbCSgIoRnXbz8CETIMk0U0=;
	b=eXUxNhHgDqr8UKM1O5qFAnNTfdqOWbWKu/caQBqbzxKZg4kcH7fMfPNcwjxNp40pSxBQz0
	Rxd0G4+5E6qwMAzZFt8bITizLDNQSdceYhZHsSiEWLV2m5LpmQVg3cPJ4iJXuzr9rxIh4y
	08AnSpf+fl766uqskE3b4Leuy0hiFwY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-Q9WzW6dkOlGWLKnAuTwVWg-1; Tue, 21 Apr 2026 09:30:36 -0400
X-MC-Unique: Q9WzW6dkOlGWLKnAuTwVWg-1
X-Mimecast-MFC-AGG-ID: Q9WzW6dkOlGWLKnAuTwVWg_1776778235
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38ea68d7d66so23751991fa.1
        for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778235; x=1777383035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFUNLVgGj6TBwQDXczffhQbCSgIoRnXbz8CETIMk0U0=;
        b=Xn1JTiXLY/cMV46ISImU+Zo40YqoaRVjW3wPvTJJciyIT8ji1KAj79LrAMQtBY7ASk
         btgzkgMR5ZJYWJ6nfigwPpuk9hG4JtmGjCMBZrHlLz7eHKVgj488w0IiMySe1yS7IgMq
         48fDxwy3HT963rXjscM71EYjHqG9K9QPhTRGQx5lZo/vzQSlxMdGDMdo+pRsOJGiUc8N
         EmRj1rnASs4jbvsDAbhpzMFSYi3/4jiMZACqSW8ZLS7fKOI+qSpgCVqqi+Ei0P+CqnKO
         Krvg6Jvl3qtjuqpDSQPqDeUy8ufu18ZszOUhfkQg8AEATiWZ4rLLOoh/5McoYrpVUsjP
         Xi0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FPSqf14BMxNQr4RM8h07bxpCbhF82CwxtTFNbfjdaQvPmcRlhDniLwGYnRaPYdCLzwBD5/U25t4eT2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWtLUgRNDot83q01uTrkHkOqFwwIfF9Pp8QIgn6kluF6/KiaG2
	1RjZJNdFBQFmAXD2rh79YjEJnmNW3I5GqQabqP9i4K1S0aXSmV1xAfl0gslptkqbSETQY+ithAH
	E030tn1ZWt1IQqo0wQqBO2Syo8klm24CWhYDcICLvPzo+8VyXtgCrDk68j95NST38r3Gx1udRdV
	92balafjvw0NwU6kqZuV2sUEVwlxOoQGPRsm43tkQ=
X-Gm-Gg: AeBDievrCD9AvgSeZuU6ROChgdxNAgeWOBao2qNVDhH4fzTEzsA/oH5DYee9Iq0TXSm
	yCJB2yaRwgouRJIZJsoBcvmCDntcOhFUundw9rzXTFNJe2EATJ6vh1LMkqaaZm/LwVWF6A3O/49
	xpibq1gUreoAsQs/wR4D++LoJTbtvB1SnmsIhn48IdhU2/5EtVTnRnGdBzwW1O5m0guzEcVK7f8
	s/LGIdfQArHhT4=
X-Received: by 2002:a05:651c:2120:b0:38e:a8ef:b61 with SMTP id 38308e7fff4ca-38ec7b479b6mr54497141fa.29.1776778235034;
        Tue, 21 Apr 2026 06:30:35 -0700 (PDT)
X-Received: by 2002:a05:651c:2120:b0:38e:a8ef:b61 with SMTP id
 38308e7fff4ca-38ec7b479b6mr54496791fa.29.1776778234483; Tue, 21 Apr 2026
 06:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420152608.6244-1-djeffery@redhat.com> <ff05ee4a-1cd8-4750-bbd2-8a8cbab59390@oracle.com>
In-Reply-To: <ff05ee4a-1cd8-4750-bbd2-8a8cbab59390@oracle.com>
From: David Jeffery <djeffery@redhat.com>
Date: Tue, 21 Apr 2026 09:30:21 -0400
X-Gm-Features: AQROBzBtok6Yzg4ok696ORQ140C5T6p4P5qZncZ6-KrGBII8XAtSjGeJb6YcdEY
Message-ID: <CA+-xHTGSbbBYOLYgcD4_964dtuh0NzrnuBS5FT=+5+dPdV055A@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] shut down devices asynchronously
To: John Garry <john.g.garry@oracle.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zZ2RyCPt2tQ322EEbdECgZDFY35bAYIlrYu8nacHHvU_1776778235
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:02=E2=80=AFAM John Garry <john.g.garry@oracle.com=
> wrote:
>
> On 20/04/2026 16:26, David Jeffery wrote:
> > This patchset allows the kernel to shutdown devices asynchronously and
> > unrelated async devices to be shut down in parallel to each other.
> >
> > Only devices which explicitly enable it are shut down asynchronously. T=
he
> > default is for a device to be shut down from the synchronous shutdown l=
oop.
> >
> > This can dramatically reduce system shutdown/reboot time on systems tha=
t
> > have multiple devices that take many seconds to shut down (like certain
> > NVMe drives). On one system tested, the shutdown time went from 11 minu=
tes
> > without this patch to 55 seconds with the patch. And on another system =
from
> > 80 seconds to 11.
> >
> > Changes from V13:
> >
> > Remove duplicate flagging of async shutdown on scsi hosts/targets/devic=
es
>
> Please mention the baseline or branch that we can apply this. I tried
> Linus' tree, but it did not apply.
>

The patchset was against the Linus tree, but is no longer recent
enough as a driver-core merge conflicts with patch 3's header changes.
I'll post a rebased version of the patch.

