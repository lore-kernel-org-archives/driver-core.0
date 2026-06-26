Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A93B83E3;
	Fri, 26 Jun 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782499009; cv=none; b=WgI3Jm0zTmzyk6YHNyJIGHGH++WwtnKtz+dbpfgvNG3uLX7G4IofDDMhKRNUBSRmaqEfTqYsLpxLgztbG/SoZbHxKdikeXKyDKQE2mR61BEePwSEM/Tt2ppp+JZ5e32SkmbKtP/7o9ZVnvwSAjSsQorwxt044pcvep7MVYEH+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782499009; c=relaxed/simple;
	bh=Tk4bcjqXisFN8quwM2VSEUM5rGaCaP2wfq/WYL+z4+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sq3k5QrsBLGGbzhY5BgUBuqRDL2j2BFG5pYFwnzaorrHPd8hFlUg9hovKEEr1vB91YKrOD2l/eXYBBL5MSpOQGfQ71Ccp0Rm9eKWK9heH65N8IIcL86DzZIWsC22ZP7JyqbbEcq4Q1OZualDHNfTLh4Wo9dufeZ1WcURSQ1cc7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YmdlhypH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YmdlhypH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD22F1F00A3D;
	Fri, 26 Jun 2026 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782499008;
	bh=g/u0z/R1t72NWnatmogSV1vfRPhM8jjFLj69hmn109g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YmdlhypHmCF80Y7bA74otPwbxDz8saOf0McKWhwt7JNaRboJCguuaUZiYeae9yXue
	 GgcLAb85lMIMHRDRtURalbZfoyoYE88vFGii76zbHQmvu0q/pphq/zkhupvr00ff4B
	 j6eYd5dXiJrj1q6Ta6FGg17ST65ow/2H8FAcywIQ=
Date: Fri, 26 Jun 2026 19:35:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/17] driver: core: Include headers for
 acpi_device_id and of_device_id for struct device_driver
Message-ID: <2026062622-economic-sterilize-14ea@gregkh>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>

On Fri, Jun 26, 2026 at 08:00:23PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> struct device_driver contains pointers of type struct of_device_id* and
> struct acpi_device_id* but doesn't ensure these are defined. To make the
> header self-contained add the (very lightweight) includes that contain
> the respective definitions.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  include/linux/device/driver.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
