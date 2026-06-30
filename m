Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9313A7F5D
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841692; cv=none; b=LBwm7aMZTOJl65Bg+/Di1+hQ/M6O9eLKgYx2q/FSMbsp0onDpYqDX30GjDdqxtMB30tBXNtPQoHckrd8ggrXu+cbvAuMceGa/fJ/BbwqRFPk6RCDdsif9/DU0Ou9JNtH8/xo3vcMN7yLYv0l9dwQHbZq+Kf22rC8TvWMbl1qoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841692; c=relaxed/simple;
	bh=ZXIAs/EWw1WxENoSTrTVVa5zbovxgFSSPFy7HJrE+Fo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WJpHoYNlwbysZLXkLvsJzKgdEzA1bnybTTVAEjmy2hce4OCTHcTF0I81HIZLXj6lcV4Gq7SkGf60Xl8eq/0a/URX9hVogCU9FEwRokfGIHO62BxqgxC+eghX79Vmr8QKBFjujaAaNzLJ0JLs8xBBWNeLKMGEmOD5G+0t0OSDpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UHtygKcb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UHtygKcb"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gqVx34WdFz9t4r;
	Tue, 30 Jun 2026 19:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782841687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXIAs/EWw1WxENoSTrTVVa5zbovxgFSSPFy7HJrE+Fo=;
	b=UHtygKcbSqU5JHz4lKxyZYVyq5daGTUd6hK5fi8zYv5MEhO4MGbusliBLIgs2+AbXH0jgj
	fp+AhLB1OBtATQ0nFRWe8p4kgR2eWbg1Wgd2QZdjp9vZfcdxbOOe3V8M5Tkj6PRwJiOWVX
	PVeW6Hijr6z4+xBZuKR3+0CZP/hK/1hki5SYeCvmsNKT4OUdou74w9In+g5gJNiXS3TCVI
	TtPdAZd+EES6wbKSnZd15iykl2106zS3fGToMbYN20bM6v4MVa2MRQ4RxIgFo2jJVjnXXr
	g1Yk49Mx43zfJ0JNRTsPwhY6jm30tL7tku8QePDHV5Av6UFQ21DpteBOOe42Pg==
Message-ID: <a69811c63a5cf7c168fa0e3eed3a40a78bd2ffcb.camel@mailbox.org>
Subject: Re: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
From: Manuel Ebner <manuelebner@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, 	driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2026 19:48:04 +0200
In-Reply-To: <2026063017-refold-entering-a5e5@gregkh>
References: <20260612145331.189632-2-manuelebner@mailbox.org>
	 <b791c2ae4a541f3794dc8c4a170db0082f513ab7.camel@mailbox.org>
	 <2026063017-refold-entering-a5e5@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 1bcd3255e0d95c46570
X-MBO-RS-META: zu9rgeoe4cu1xim5dpaepd7dcrcribuw

On Tue, 2026-06-30 at 12:57 +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 30, 2026 at 12:48:01PM +0200, Manuel Ebner wrote:
> > Hello,=C2=A0
> > is this patch still on it's way?
> > Resent for context.
>=20
> Please do not top-post.
>=20
> This was sent during the merge window, please give us a chance to dig
> out from the hundreds/thousands of patches sent during it to get to
> stuff like documentation updates.=C2=A0 It will be a few weeks.

Ok, I understand now.

> in the meantime, please help review other patches on the lists to help
> reduce our load.

That's a good Idea. I'll aim for at least two reviews for every patch sent,
from now on. This way I'll get to know more than just /Doc.


Thanks
 Manuel

> thanks,
>=20
> greg k-h
