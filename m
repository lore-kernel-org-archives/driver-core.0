Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C832824B
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460534; cv=pass; b=BsFRQuYd8SK/jYCnMRzkDJ0sbQcBAHndcZknye49SzhJ59VhwyC6qiMkmHaMU3XoA0rRc2Ih5cTt3xpF4D5aBugndgSv0k5HB2O0quZwjDm+0MacZFDgwfaUCatEplrHQd0sO8EogdPcmnGGKck9B4n27qCx1M7ECioqY1bwEDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460534; c=relaxed/simple;
	bh=j4vbTkMHrqahFcFEYeT5VCU61Ma6CvquGXAoLyjKjpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZqhXZPyFNrfT0dO3BLD0jYKxbCrao9l5OrQuJRK+LlYEWm1EU8zCaDmwsTdEEmvUlyESKP81aKYKaOJBURMSxY89L3bGbII8MCJ5fTQLeAk8ifDtcQGi1PQiczME020EfDIUxRhLhcXkHy5Kl157BAUFff1jK4oE7zKu7nYtfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygks9quz; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygks9quz"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8111c0c7561so37690217b3.3
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 08:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786460532; cv=none;
        d=google.com; s=arc-20260327;
        b=EYVLe2xUEjg2od0P2s1V/uohdPXgJAiMSRzjoM6lEGNB9W5wQW1HnqVdWr1T8M2SSJ
         0QJRkdGlkYjsExmxgjPLRzc8sHq0khYNgZ4YCwROlr86wt1lb61xn3p5DEfuXGBJoXEF
         pBj8uD+CrKGcelQQzeK8UASeh+jlT1yo5nG0aUb7MZYBiXg3JjbuscvvZaEZw7IUwuHA
         hJR4wH3bJ9XAQ3+X0Ej5/edNK1TWOJ6xiYSqsQkWEFKo7/iV7roAK89je2erQEq5wJtr
         42xhqwTUWij92l/eWyTtSnTq2tR0HbLyBi093iWOJX36al1EmsBpS6kClzrraGxLfSII
         vcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOFGdGD/+2nP6RQWzZ2s2mHQTcJH8q2oU5hHFRYmAkY=;
        fh=PqXgntkfzj8OWXtSaDo9djTY01Hybc4oNoMHnrDuoKU=;
        b=bvgbAvvE3FjDE9848sUst3URK9EHpTId+BN98aMqWV6neHx7ZSwa4LAj8LsqPIbTt1
         1gUFRzX2fi2yzyqadgIXP6/ic1SXf1Fz0ZofPcfGzhSzFFfvqlaxd0G75ibm9eVOQlju
         WN6YvkUvkJDlfAcHOnIl1uSPcXNGeeNjX9+duJCrKyPbFlx0+Z12Kf8RY+ZkSc9YjROn
         nsBFwankmZBcYl4uiwkRP/6WWtrqMWAufEUd5lO0boIToEJK/CIIYDQILU3uj0PIMU2b
         NLpeNV/8WsKtErwT+0AGweY2DSCoh1wW2RFuBDCa3fDwz8vHpMaUVGjBShakJZAS7IZo
         H8YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786460532; x=1787065332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DOFGdGD/+2nP6RQWzZ2s2mHQTcJH8q2oU5hHFRYmAkY=;
        b=Ygks9quznKPpAhS5Im4y45KFJ+xEd5xXMmdGIXnQWkucP/lCMXosIVMY9GDg1ys/3f
         ivWGH7MQgKnTW+pvrHteT0U2wx6d8c7BTl2yiAMG9F8mCuau5iJhmzoejvdpb79YrQkr
         CWIR3MH2qXS0y9hr9Vo1F2BvlFFWGE/MCTRuxybqvxmiSpnl1dB4GZWgoSbUDA/rIqu2
         zftXJxPVbVwBM5yIn0gW0edIKcXNhcJFd0b7VnoRaiwyxyBDwGJSOdcpf/91Cf6ihkRH
         cYPQwlfz+WrSEq0KmYUNwSzRulC2xibWop/BWTxu7L0AH28oiba5zZ/kY3oa5LGU0E6Q
         gp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786460532; x=1787065332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOFGdGD/+2nP6RQWzZ2s2mHQTcJH8q2oU5hHFRYmAkY=;
        b=dUrSQLGIEvUhq+nRFoppwDnaygQ7vF72s0X7FjGGgU3pk1tGrEnQT4EK/eSHcrnqhu
         4gK/5QzhyBGcjbVJe5ar0quFiVAtlaa+vDbAj2I66Oba4hz1Y52ZizqnFKGWZrmvavOz
         PFLeAAfoECxB/vNpunRr1mwTJ3s8dWJV5Nv67q/86V84urJXKIt2BvAYdmNoM0PAR1cu
         2NQCLjXqwIkdlCJtAlDLtdPOsyZOWUadxb5G/HUnrkEvXEWvpSE6gATfo3/6T1qoVPVt
         y7kgy/bgG+AvAvkmigVjvGU/GN3EOmI1BcqSlv2OXvw3iBPhggZHunApCzoLvDIMgTqD
         Gv9A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2mh6dCPRK+QhXQj2ExUGTyPBpse+1w+wKvKyWi6JkZR3PXdJ7PEPA6CgZXDUdt8WrDA47qHjMweSVhA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1lsOii5izbvJkzjFzhHJ21lpwS8JBmu1t8a/1PJxCNifVBFei
	GNHP6qh1tb92diLUY3JBcodq+USRdaAFM+60Fex6B3LsjWz5wrE/MR9oJijoDlYD25kQQT1DJPU
	2YrJXz+v1qyNZdY8wGrR0kNUjhKPPYPc=
X-Gm-Gg: AR+sD13P2kR1RP9gZ6sZLoUcJUWDNGmybavgkW60LthCWYZYnk8q4GNR211bhUr6m8Q
	cQ8MxGDx0NLuMG000HQX5XX5Lwc1L5nHaeXYw2tsNCgk04wzbdYmzur/MYysEqIbwrZ7LTdCG+S
	YsUJz7YCsNFCT+3I69WdiD5D4narzgDvZQPrh6bxS3e52oYpvLH9iK2gi19qfYVEz2J6q4djBWR
	QcFLIxtqTe2u8PIkTL4AJVDHVFn0xe4IyHEnpbX+15cC+RNR9NIIQan87fat+26Y29wUsljJgHJ
	0um7v8g9Q08tXyBn0QhPKUeWKCJRWorTt4RC0gvDQDvn29xzdSKs4AMUqO9YyFYFuPT9JNBawyJ
	dOUGbnANCBZfU6sxRkMt6hHMb8T4NhGQ=
X-Received: by 2002:a05:690c:88:b0:7ff:1399:9317 with SMTP id
 00721157ae682-8303dc941b6mr6987997b3.11.1786460531677; Tue, 11 Aug 2026
 08:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <anpxFdwNxk0XwPjQ@makrotopia.org> <2026081139-strenuous-greasily-f4e5@gregkh>
 <cb0d42dd-4755-49a8-8a05-297e4283914e@oss.qualcomm.com> <2026081133-crazy-enquirer-97ce@gregkh>
 <154779e8-5f73-4f3e-8618-104effb85538@oss.qualcomm.com>
In-Reply-To: <154779e8-5f73-4f3e-8618-104effb85538@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 11 Aug 2026 11:01:58 -0400
X-Gm-Features: AUfX_mxYe-nElnQSrdmasbUvVVMeEoXpj9A_1Sq8Txj9OmoMmXB5_-_tVdXTCcc
Message-ID: <CABBYNZLHnKnorEbp=LuxcvCUBOpoKHZbV=R9DYzjJyOiFUU06A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] device_schedule_reprobe(): core helper and conversions
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Golle <daniel@makrotopia.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, linux-wireless@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, 
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, Kiran K <kiran.k@intel.com>, 
	ChandraShekar <chandrashekar.devegowda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Aug 11, 2026 at 4:51=E2=80=AFAM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 11-Aug-26 10:07, Greg Kroah-Hartman wrote:
> > On Tue, Aug 11, 2026 at 09:32:45AM +0200, Hans de Goede wrote:
> >> Hi Greg,
> >>
> >> On 11-Aug-26 04:33, Greg Kroah-Hartman wrote:
> >>> On Tue, Aug 11, 2026 at 01:47:17AM +0100, Daniel Golle wrote:
> >>>> Three in-tree drivers (iwlwifi, hci_h5, btintel_pcie) schedule a
> >>>> deferred re-probe of their own device from a work item in module
> >>>> text.
> >>>
> >>> That's a mess, why?  Why not fix that up to not do that?  Thousands o=
f
> >>> other kernel drivers do not do that, what makes these so special?
> >>
> >> I can only speak for the hci_h5 driver where I added the reprobe code-=
path.
> >>
> >> The problem is some of the Bluetooth HCI devices using hci_h5 loose al=
l
> >> state during system-suspend. This means that the HCI and the Bluetooth=
 core
> >> end up being out of sync.
> >>
> >> So we basically need to tear down and re-build everything including
> >> e.g. the firmware upload which happens at probe(). Doing a full reprob=
e
> >> is by far the easiest way to do this.
> >>
> >> I suspect the other 4 users + the pending driver which triggered
> >> this are similar.
> >
> > Full reprobe feels different than the THIS_MODULE stuff, which is what =
I
> > objected to here.
>
> Right, the helper from 1/4 to safely do reprobe from a worker actually
> removes the need for THIS_MODULE stuff :)
>
> The THIS_MODULE stuff in the open-coded implementations is there to
> avoid someone doing a rmmod while the reprobe is running. The new
> helper replaces this with some checks in the workqueue function
> checking the driver has not been rmmod-ed in the mean time.
>
> >> Sure we can do the whole tear-down + setup from some worker
> >> scheduled at resume, while keep the driver attached but if we need
> >> to duplicate that over 4 drivers + the pending driver which triggers
> >> this then IMHO those 5 users are a pattern which deserves having
> >> some helper to do this through the existing probe() + remove(),
> >> rather then requiring those 5 drivers to open code this themselves.
> >>
> >> Note that we already have device_reprobe(), which has 15 existing
> >> users. This series just adds a helper to do a device_reprobe() from
> >> a worker in a safe way.
> >
> > That feels a bit better, as long as this code really is "safe" :)
> >
> > So, how can this be tested and fixed up so it isn't a RFC anymore?
>
> To me it looks like the main things are:
>
> 1. Agree that a helper to safely do a device_reprobe() from a worker
> is helpful (I think this is done now?)
>
> 2. Get patch 1/4 reviewed. I can do an initial review but I'm not very
> familiar with the driver/device core internals.
>
> 3. Test this. I can test this on a hci_h5 BT HCI that will hit this
> code path.
>
> I'll try to get 2. and 3. done soon-ish.

The 2 Intel drivers are related; they are part of a combo Wi-Fi + BT
solution. This is why they attempt to reprobe each other to recover if
the entire system (not just wifi or bt) has run into a fault and needs
to be recovered as a whole.

As for introducing device_schedule_reprobe that seem to be a great
initiative, thanks for leading it.

--=20
Luiz Augusto von Dentz
