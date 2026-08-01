Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724573ACA7E
	for <driver-core@lists.linux.dev>; Sat,  1 Aug 2026 03:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785554030; cv=pass; b=foHhisiU8aiYr0WFuFY2KgyBfC9BFnD9XvTLSZZi9LnHOfNAAauo0c7k3FO2dCIVo1p6xicA9BVCqrMSVqP+Db+vlBLu+ywLu2Q3S2kzZNEOCUpAIbFguNTKMEWfXcZasoyKTvjn3K7U48KwO4t9nehjtnBLQ8kavw+yhJQePyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785554030; c=relaxed/simple;
	bh=95QCJbuFW0DJ4I2GQ9WngTVOHrimeZjlLTACZfyrPGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0bBq7LA+DtjUf5eTZfH0teNNFi5JxflzhO2FpbQK9QmFXYQpcwqHaVNqs4PFJVVq/7LJ+qMw061oUCfEsRe2ISGN6nTJxoV8V/Xu5D++zNcMkeDnausDj7zIRJG6lGSruBHrWcL1Pr9QX5MPzYRNF2ahtf06xl8lfCeQFk3hyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=debian.or.jp; spf=pass smtp.mailfrom=gmail.com; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=debian.or.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81dfdbd86d1so17270717b3.1
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 20:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785554027; cv=none;
        d=google.com; s=arc-20260327;
        b=F3oI0S2RsW+YWTwI86jg/1NrSJ1VfeyRjLzC+CrSi6dt2Z9dTIeFK8qU17rkrWg471
         ZFp8g8ZVadw9hoD13KLzeYGIJ//SU1/H7ix6P/NC6f6o3eELEOGLzRbbDkEgG8L1s3FL
         NIRcfDNQDJeoSdEHwrB9aW05HMaIo4BrhEOUH0Jg0Pg0RM+NUC9eZPPNT9RbYIfs7FX0
         b2iNzg6nNe4LOwnMdgrPlOxQYZnO1XnEbdaotyQx07dxilBqNTx9MlW9pI5IuaHKD7fH
         Ml6k7ao7hzNT07WK8+AkdCnqoN2wpGZIU/e34irVH6rjPlJL59m510b4Gt2ioYmDVEub
         6bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=SeAZ9LnHsy3/NLwDMK5sclw7WS1BzURw2kr/GeL6nEM=;
        fh=2mvb2785BCR3DKq4bJD2P8P7tEXoK4DBgun8ekWg/Ps=;
        b=R6nxZkqyGW536gZmYesyR4v/jbSxGsEFNuMiAiVSzgGI9mtQNaH6fiWdyy1qtlgMhA
         lHEg7/ABotlt/8UnGCiTTvOu/ZbC82wiRb9CfXCNDgu8IM/vjTjdY9WUYbI/lPhddThr
         /VLYtdHQxFSrK7hgG5rgRL+bhVIogjWIKg4Bq+iYSQo2loqHRCRGEEsWVA8gyfUN9reX
         eHNNvh700T9I4DfQRz51OZwsrNcyq7efEEbGrV7UkvQ609S+ZmHtTxo5T9NZPOnv4SIL
         HbIX+omFiabg9t8CZQKZDEQdNZUBhOzKEOrux1QaWq29dtlwS6s8hFoPLOs0nEwsHwa3
         1trQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785554027; x=1786158827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeAZ9LnHsy3/NLwDMK5sclw7WS1BzURw2kr/GeL6nEM=;
        b=VPFxG6iITMznMFAlpgAmFvYufnzONmMMBr76/tJf2JIYxXe8kVrgqc3qjI7/80/Lrb
         guHqlcvlnPCz+ZbKDhL4g0fw2ZJjbMlv6yvBNrCCgK586wi/jiNSYoYMBemz30gC4Uf4
         JhYpZwJGbR0nm77zzyTuptZalKlVOdHmNCSjjID9s4sdURuL7KjT60YIZU50guSouJgU
         PM+XDpkk8+HZymTRMI1RXvtGlJHDQpOSpTCIKS4PQBwL/UJcu2tNSlxbngHpGK9BDORY
         lpYQSrGQNDIvhOJXT3+IkH1iXtROwTs/X8mSheoQjj9khxc5BP6W8RVY78SAIAywRAww
         6ECw==
X-Forwarded-Encrypted: i=1; AHgh+RrD53l9F/XTHDvkYR8dWVJJ2K4WZlu8snV6vW2vI+Li/lobdsD14Ek20/hXjfiASlAMr4UoQOZyyOSTxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuWg5NlewKkbPkFXzZNC9+xr3mltqZ0MyN+r220s1m80U1UjtW
	e6sdxj9TqsuGJ/gsUYjiw38pzF2t3DUlhJno59w+3CMeZbaeit3RMJjltgHzW7gLf5JERJ05DMT
	19+OznRMrYiCk8gJLOGug5Bm3d8kmBEE=
X-Gm-Gg: AR+sD13Xa7KfSq8ihQpVESXeyiNxpHaTpo7eaTNlCJ8OWj7XN0vficmihOK8EPuTPyX
	+7nZEFhyejvGRltqcYVJGaxmhlAuPX2ceagvI49UMtyzxdUZ7V1iE0W2oTK2RoudgARWJbjLJUT
	CGOkfuRHem7SsTPV4t+xPdD9b7ciYjAbD8zS6p/2PHAx8JbZY6ygRyom889a5+zK4KeNWRAursp
	2aawJceiFJaDzJFkZXZcTNaYZRVAHbw4QBdt1YBk2mdDMqH+pfiCTihCwyZxlVDhfE9i54TStRw
	eACqspyBXJFXWkCl3GfIpzXdJB/0desAQhkgZOJL7Nu5L+FhsDiiQOSE2XAkHWvARxgG9x6QYZp
	GTw==
X-Received: by 2002:a05:690c:278a:b0:81c:b865:2231 with SMTP id
 00721157ae682-81fd4bf88ecmr32651387b3.33.1785554025363; Fri, 31 Jul 2026
 20:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-pci_id_fix-v4-0-3580726844e1@garyguo.net> <20260728162538.GA1325438@bhelgaas>
In-Reply-To: <20260728162538.GA1325438@bhelgaas>
From: Masanori Goto <gotom@debian.or.jp>
Date: Sat, 1 Aug 2026 12:13:18 +0900
X-Gm-Features: AUfX_mz7siEIuZSDLGecSdNp4xhgCzEOOClyi0oT7r0lmGspOzwc1eUhhS3W20M
Message-ID: <CALZLnaEmm5Zi=30n4i7ioX9ii4KMAePnZTAhAcNScSZFSNB7UA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] PCI: Fix UAF and TOCTOU related to dynamic ID
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zhenzhong Duan <zhenzhong.duan@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Vaibhav Gupta <vaibhavgupta40@gmail.com>, 
	Jens Taprogge <jens.taprogge@taprogge.org>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@redhat.com>, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, industrypack-devel@lists.sourceforge.net, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm a "nsp32 folk", which patch version should I take a look at?

Best regards,
Masanori


2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 1:27 Bjorn Helgaas <helgaas@k=
ernel.org>:
>
> On Thu, Jul 23, 2026 at 11:00:39PM +0100, Gary Guo wrote:
> > While working on improving the Rust abstractions [1], Sashiko reported =
that
> > an existing UAF issue related to dynamic ID, which I find to be genuine=
.
> > When taking a look at the code I also find a TOCTOU issue where the
> > existence check of dynamic ID happens in a separate critical section as=
 the
> > actual insertion. This series fix both issues.
> >
> > There are two exported functions pci_match_id() and pci_add_dynid() whi=
ch I
> > have to tweak to implement this cleanly; I created separate "do_xxx"
> > functions to keep the existing APIs because they all have multiple user=
s.
> >
> > There're a few existing users which stores their pci_device_id argument=
 in
> > probe callback. This is a bad pattern because nothing except driver_dat=
a
> > inside pci_device_id is what they want; actual ID information can be
> > retrieved from pci_dev instead.
> >
> > There are two users that performs pointer arithmetic on the pci_device_=
id;
> > these are also problematic with dynamic ID and driver_override, so fix =
them
> > as well.
> >
> > I've used the following coccinelle script to flag all cases where the
> > pci_device_id is used other than reading its fields.
> >
> > @usage@
> > identifier fn, id;
> > position p;
> > @@
> >   fn(..., struct pci_device_id *id, ...)
> >   {
> >     ...
> >     id@p
> >     ...
> >   }
> >
> > // Due to cocci isomorphism this needs to be explicit
> > @bad@
> > identifier fn, id;
> > type T;
> > position usage.p;
> > @@
> >   fn(..., struct pci_device_id *id, ...)
> >   {
> >     ...
> >     (T*)id@p
> >     ...
> >   }
> >
> > // Good use cases
> > @good@
> > identifier fn, id, fld;
> > expression E;
> > position usage.p;
> > @@
> >   fn(..., struct pci_device_id *id, ...)
> >   {
> >     ...
> > (
> >     id@p->fld
> > |
> >     E(..., id@p, ...)
> > |
> > // Redundant checks, but ignore
> >     !id@p
> > |
> > // Redundant checks, but ignore
> >     id ? ... : ...
> > )
> >     ...
> >   }
> >
> > @script:python depends on usage && (bad || !good)@
> > p << usage.p;
> > @@
> > coccilib.report.print_report(p[0], "suspicious use of pci_device_id")
> >
> > Link: https://lore.kernel.org/all/20260618-id_info-v1-0-96af1e559ef9@ga=
ryguo.net/ [1]
> > Link: https://lore.kernel.org/all/20260619170503.518F61F00A3A@smtp.kern=
el.org/ [2]
> >
> > ---
> > Changes in v4:
> > - Code and commit message style fixes (Bjorn)
> > - Link to v3: https://patch.msgid.link/20260706-pci_id_fix-v3-0-2d48fc0=
25acc@garyguo.net
> >
> > Changes in v3:
> > - Fix users which uses pci_device_id for pointer arithmetic. (Sashiko)
> > - Convert to scoped_guard. (Danilo)
> > - For static IDs, still give out static pointers and avoid making a cop=
y.
> > - Link to v2: https://patch.msgid.link/20260630-pci_id_fix-v2-0-b834a98=
c0af2@garyguo.net
> >
> > Changes in v2:
> > - Fix users which store pci_device_id.
> > - Clarify in probe documentation about the lifetime of pci_device_id
> >   parameter.
> > - Dynamic ID conflict check now ignores override_only. (Sashiko)
> > - Link to v1: https://patch.msgid.link/20260626-pci_id_fix-v1-0-a35c803=
f1b95@garyguo.net
> >
> > ---
> > Gary Guo (9):
> >       ata: ata_generic: don't store pci_device_id
> >       scsi: nsp32: don't store pci_device_id
> >       ipack: tpci200: don't store pci_device_id
> >       mlxsw: pci: don't store pci_device_id
> >       agp/via: Don't rely on address of pci_device_id
> >       agp/amd-k7: Don't rely on address of pci_device_id
> >       PCI: Make pci_match_one_device() match on ID instead of device
> >       PCI: Fix dyn_id add TOCTOU
> >       PCI: Fix UAF when probe runs concurrent to dyn ID removal
> >
> >  drivers/ata/ata_generic.c                 |   6 +-
> >  drivers/char/agp/amd-k7-agp.c             |  26 +--
> >  drivers/char/agp/via-agp.c                | 308 +++++++---------------=
--------
> >  drivers/ipack/carriers/tpci200.c          |   1 -
> >  drivers/ipack/carriers/tpci200.h          |   1 -
> >  drivers/net/ethernet/mellanox/mlxsw/pci.c |  11 +-
> >  drivers/pci/pci-driver.c                  | 194 ++++++++++---------
> >  drivers/pci/pci.h                         |  43 +++--
> >  drivers/pci/search.c                      |   8 +-
> >  drivers/scsi/nsp32.c                      |   8 +-
> >  drivers/scsi/nsp32.h                      |   8 +-
> >  include/linux/pci.h                       |   1 +
> >  12 files changed, 237 insertions(+), 378 deletions(-)
>
> I put this on pci/enumeration and plan it for v7.3, hopefully with
> acks from the AGP, tpci200, and nsp32 folks.
