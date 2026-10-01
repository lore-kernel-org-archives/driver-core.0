Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134B331209;
	Thu,  1 Oct 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860055; cv=none; b=ubKHUtMtr6SXi1/AulKpoJ2hCos2Gu2t5ZH0nsN8WmRP/SfIvbQJAJvyiSin23FJ9JmVMwprc5ZPUCdQ7njPsTmg7VqJ+u3ICdidx7k6sdorLvvExJP9LLrplVtDgOtPGqYyItGX1PS/EtJVcNqRhcJJ32hdXyC8ei8Mc0AFqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860055; c=relaxed/simple;
	bh=xZYkgjaeuMyOeKjIpBtMHN4AKiwBzIUSJNpvIogT2ps=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uxSsIUbVHelt7PIW0CV+gmnKRmk5o7MRLTb3t/dG9sIXMtffRBu3LUkUz57OFhmhWH7ytnyI1hEtK2+9JpAKB4oQ4OkTLFoMGuLHi8pYbVCeIJ5hiTqqJmdktvxj5mbkQYRw8Kb8zArJCAtDUmt++If1swW27yormZ7c71Ne0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNioMI8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNioMI8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9561F000FF;
	Thu,  1 Oct 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860054;
	bh=xZYkgjaeuMyOeKjIpBtMHN4AKiwBzIUSJNpvIogT2ps=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FNioMI8S1Ho3AwVGvesNmFb5k8kaAqZmXJByev9u8GywDbYrk2ya71RWaFtq4AcGr
	 DflostSwcHZDiGSMjUEXbzHmhtLphlXWQWC0unzGqXwCpGCss4IfuvIs9H8rDFZI2G
	 Jahy8BktoiP4Etkn4qSZQUVhl+uNZOYLhXS6fLItjElkGRP/ACJgTuM2tNNccTrgOm
	 +y3EV/y2e/Ple6bW00Ni1s7wgXKyCXqGe9SmVxjdBE4D9M03SW2BCyvu0c3e7fqSCj
	 vLfF4ypmbKcb++5PW5QXiu2sks1th7yiINiLzQJaiWZ2ROl0Ry5l0m5hK1BXuUHe7E
	 AGr+BOboQnEaQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 15:07:31 +0200
Message-Id: <DLTIWLW8OZ9Q.166G8IIIIYCHL@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as driver core maintainer
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260928074329.853637-1-johan@kernel.org>
In-Reply-To: <20260928074329.853637-1-johan@kernel.org>

On Mon Sep 28, 2026 at 9:43 AM CEST, Johan Hovold wrote:
> I will be helping out with maintaining driver core.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
