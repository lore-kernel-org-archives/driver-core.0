Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6A343D7B;
	Mon, 13 Jul 2026 04:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917862; cv=none; b=M4GP/7kJvFo62LBVMxvhwl1GcPiZaGNvteMFL89voEj3mlD/f/p0kpx3y8OfHd343pmC3hKSwsncEr0Tdj/bx2FXX67IRYvYlD42F95MOpO/JjLFEpM59oqMySyvRSxphNdooUiBrIgXlfJRWpGnUElwtErnrfX3Sn5a1ws87wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917862; c=relaxed/simple;
	bh=flHtV7i/w45C24KBq93t5+ErgpVF6y1re9TZkcn3DxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFjlSWdZ9cPtNtuiWglLuSwkuoxq2FKQresK2VqKnun6KgJiOw3QGQ2Jy6wU9mHHJHbxYK8JEpu77YM9OJqPObvOeblWCkStKS3BhME4JrqCqq5fp8Gmmagz1rkkdP47ldV2ir1jjkweZh49bEvSBsahHIGjCDfKaZofKiLp3sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pRz8zTyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pRz8zTyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661AB1F000E9;
	Mon, 13 Jul 2026 04:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783917860;
	bh=Ine80bMW4Ll1URmVddsaJdGPb3kOy4b70gjhwFhFvL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pRz8zTypbF8/C/bE+ZG57vdH0nK4Ws6utLVXpIk5LDf7fuNNc1SCb2TTpHQ38LQ9N
	 P2RbwMBDet5buOdHxBzA+YRPm+989g6n5JZ2FdITaUBp/Pzt2O2AQPUgA5sCBbFUTM
	 q/bib6ruQHnlaz2nR6O4pCBRIx94y63xUL6+uMRk=
Date: Mon, 13 Jul 2026 06:44:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: driver core: faux: Move a variable assignment behind a condition
 check in faux_device_destroy()
Message-ID: <2026071305-retract-banker-c14e@gregkh>
References: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
 <2026071217-fruit-uphill-eb0d@gregkh>
 <d96e797a-2d06-42e0-a3de-972b4f71a5ef@web.de>
 <2026071222-barracuda-applause-51e8@gregkh>
 <16f32db1-03da-47be-ae6f-54304199a3f4@web.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16f32db1-03da-47be-ae6f-54304199a3f4@web.de>

On Sun, Jul 12, 2026 at 06:54:13PM +0200, Markus Elfring wrote:
> …
> >> Please take another look at related information sources.
> >>
> >> EXP34-C: Do not dereference null pointers
> >> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standard/rules/expressions-exp/exp34-c/
> >>
> >>
> >> See also:
> >> https://lore.kernel.org/kernel-janitors/d7a8e34b-e490-47fc-b892-886e1c799c4f@web.de/
> >> https://lkml.org/lkml/2026/7/2/2241
> > 
> > Please see the places in the past where I have rejected this very patch.
> > Nothing has changed since then.
> Can involved special development views be resolved better by applying scope-based resource management
> for the affected function implementation?

*plonk*
